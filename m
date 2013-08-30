From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 30 Aug 2013 09:35:51 +0200
Subject: [Buildroot] feature or pebkac
In-Reply-To: <20130829153937.f53bdce09f0a855807dd0a5d@lavabit.com>
References: <20130829111708.c603e5bf976541d3abd3a43a@lavabit.com>
 <521F9B91.7040903@mind.be>
 <CAAXf6LUg_9ch_A5ZrjZH7nJB2d_4g1BhcK_QhmDKV+dNVpX20g@mail.gmail.com>
 <20130829153937.f53bdce09f0a855807dd0a5d@lavabit.com>
Message-ID: <CAAXf6LXqhnWP2kz=3fnEDEhfr=HvVqZCUK-OEh-0X00e=n2BMQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Aug 30, 2013 at 12:39 AM, rh <richard_hubbe11@lavabit.com> wrote:
> On Thu, 29 Aug 2013 22:25:55 +0200
> Thomas De Schampheleire <patrickdepinguin
> +buildroot at gmail.com> wrote:
>
>>
>> I once proposed a patch for this particular case:
>> http://buildroot-busybox.2317881.n4.nabble.com/PATCH-v2-linux-custom-tarball-automatically-detect-a-change-in-tarball-configuration-td11414.html
>> but unfortunately it never got accepted. One of the remarks was that
>> the build directory name is odd in the sense that it contains the name
>> of the tarball. But it fixes the problem perfectly, we are using it
>> all the time.
>>
>> If there is interest in this, I can resubmit the patch.
>
>
> Ok I read that patch.  Can we use sym links? If so I propose that
> we untar and use the tar ball name but then remove and create links
> pointing to the new directory. This way linux-custom is always there
> as a sym link and any dependencies on linux-custom are fulfilled.

Which dependencies on linux-custom are you talking about?
Inside buildroot, all references to the linux directory happen through
the variable LINUX_DIR, which will always be correct. Scripts outside
of buildroot may try to access the fixed 'linux-custom', but this
behavior is broken anyway because the board developer could choose to
switch to a vanilla kernel later on which would cause another
directory name too.

Thanks,
Thomas
