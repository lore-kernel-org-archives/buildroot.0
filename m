From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Sun, 24 Aug 2014 20:31:12 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/pkg-autotools: don't use
 config.site when cross-compiling
In-Reply-To: <53FA1527.80803@openwide.fr>
References: <1408698774-13615-1-git-send-email-romain.naour@openwide.fr>
 <20140824181422.5dd8c43d@free-electrons.com> <53FA1527.80803@openwide.fr>
Message-ID: <CAAXf6LXHQFBULTk3YExWOSorRKSmCF9-sFkwK6iEGf-NVeVzng@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Romain,

On Sun, Aug 24, 2014 at 6:39 PM, Romain Naour <romain.naour@openwide.fr> wrote:
> Hi Thomas,
>
> Le 24/08/2014 18:14, Thomas Petazzoni a ?crit :
>> Dear Romain Naour,
>>
>> On Fri, 22 Aug 2014 11:12:53 +0200, Romain Naour wrote:
>>> On fedora 20 64bits host, the file /usr/share/config.site contains
>>> a fix for installing libraries into /lib/lib64 on 64bits systems
>>> that redefine libdir in the generated Makefile
>>>
>>> For safety and avoid the bug #7262 [1], disable loading this file
>>> when running the configure script for the target and the host.
>>>
>>> Note: configure scripts generated with autoconf < 2.65 will source
>>> the /dev/null and print this line:
>>> "configure: loading site script /dev/null"
>>>
>>> [1]: https://bugs.busybox.net/show_bug.cgi?id=7262
>>>
>>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>>
>> I am wondering if this change should go in master (for 2014.08) or in
>> the next branch (for 2014.11). That close to the release, doing a
>> change in the core infrastructure seems a bit invasive to me. What if
>> it breaks the build of other packages? Seems unlikely, I admit, but
>> still. What do others think?
>
> I think this patch can go to next since the issue is already fixed in master but
> just for host-localedef.
>
> Actually, it seems that only host-localedef was affected by this issue.
>

I was going to judge 'master', but then I saw Romain's reply. The
reported bug is indeed already fixed, and no other problems were
reported so far, so I agree now with applying these patches to -next.

Best regards,
 Thomas
