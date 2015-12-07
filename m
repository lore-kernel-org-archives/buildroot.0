From: Steve Calfee <stevecalfee@gmail.com>
Date: Mon, 7 Dec 2015 08:47:46 -0800
Subject: [Buildroot] Mosh and buildroot: UTF-8 locale issue
In-Reply-To: <CAK9TtU2RHCgLAJnpL9Wq6Oao99VsB3Q7F1UeUiPsM_TZGH87uQ@mail.gmail.com>
References: <CAK9TtU2RHCgLAJnpL9Wq6Oao99VsB3Q7F1UeUiPsM_TZGH87uQ@mail.gmail.com>
Message-ID: <CAJJ6jxuHpCC9DepibBFG=eYOFbzYkLknj-jMUWuWzBo+bmPYaQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This is a true user issue. Most of the mailing list traffic is on the
build infrastructure. However, most people here are also users....

I could not get utf-8 to work on my buildroot target system. The
problem is someone, upstream conflated the relatively simple utf-8
encoding with the much more complicated localization. IMHO, most
embedded system would like to use uft-8, but are not that interested
in getting commas, or periods straight for formatting numbers and
dates etc.

The Linux kernel avoids the whole issue by just treating filenames as
strings of bytes, without caring (much "/") about what the bytes are.

I was trying to read in python files in a filesystem written by
another Ubuntu system which did handle utf-8. Part of the problem is
Busybox needs to have options set for it to use locales and utf8. I
gave up as it involved getting user space shell variables (locale
etc), assumed file system location of the huge locale info, and the
Byzantine design of python 2 and utf8.

If you make progress with this, please post your results, it will help others.

Regards, Steve

On Fri, Dec 4, 2015 at 5:26 AM, Sylvain LG <forum@sylvainlegourr.com> wrote:
> Hello,
>
> I've just built a filesystem with Buildroot and I've selected Mosh package.
>
> But an error appears when I try to connect with Mosh to my system:
>
> $ mosh root at 192.168.1.10
>
>> The locale requested by LC_CTYPE=UTF-8 isn't available here.
>> Running `locale-gen UTF-8' may be necessary.
>> mosh-server needs a UTF-8 native locale to run.
>> Unfortunately, the local environment ([no charset variables]) specifies
>> the character set "US-ASCII",
>> The client-supplied environment (LC_CTYPE=UTF-8) specifies
>> the character set "US-ASCII".
>> sh: locale: not found
>> Connection to 192.168.1.10 closed.
>> /usr/local/bin/mosh: Did not find mosh server startup message.
>
> How can I set Buildroot config to fix the issue?
>
>
> Thank you,
>
>
> Sylvain
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
