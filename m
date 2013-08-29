From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 29 Aug 2013 22:25:55 +0200
Subject: [Buildroot] feature or pebkac
In-Reply-To: <521F9B91.7040903@mind.be>
References: <20130829111708.c603e5bf976541d3abd3a43a@lavabit.com>
 <521F9B91.7040903@mind.be>
Message-ID: <CAAXf6LUg_9ch_A5ZrjZH7nJB2d_4g1BhcK_QhmDKV+dNVpX20g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, Aug 29, 2013 at 9:05 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 08/29/13 20:17, rh wrote:
>>
>> I have found that changing the url for a custom kernel tar ball does not
>> trigger a rebuild when running make.  I have removed linux-custom dir
>> and then make fetches the new tar ball and rebuilds.
>
>
>  That's right. Buildroot doesn't try to be perfect for rebuilds when the
> configuration changes - but if it is simple to fix, patches are welcome!

I once proposed a patch for this particular case:
http://buildroot-busybox.2317881.n4.nabble.com/PATCH-v2-linux-custom-tarball-automatically-detect-a-change-in-tarball-configuration-td11414.html
but unfortunately it never got accepted. One of the remarks was that
the build directory name is odd in the sense that it contains the name
of the tarball. But it fixes the problem perfectly, we are using it
all the time.

If there is interest in this, I can resubmit the patch.

Best regards,
Thomas
