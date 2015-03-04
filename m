From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu, 5 Mar 2015 00:38:25 +0100
Subject: [Buildroot] [PATCH v3 2/2] logrotate: use pkg-config for the
	opt library
In-Reply-To: <20150304232909.625985fa@free-electrons.com>
References: <1425244013-2509-1-git-send-email-fabio.porcedda@gmail.com>
 <1425244013-2509-3-git-send-email-fabio.porcedda@gmail.com>
 <20150304232909.625985fa@free-electrons.com>
Message-ID: <CAHkwnC_SRcjuP+yk4_O8WixZLKVuxLRs-N4+xe12doA=a27jSA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 4, 2015 at 11:29 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Fabio Porcedda,
>
> In the title: s/opt/popt/
>
> On Sun,  1 Mar 2015 22:06:53 +0100, Fabio Porcedda wrote:
>> Without using the pkg-config the dependencies are not included for a
>> static linking so it fails to build.
>> These failures are fixed by linking the libintl library that is a
>> dependency of the opt library.
>
> s/opt/popt/
>
> I've fixed and committed. Though I have one concern below.
>
>
>> +     $(MAKE) CC="$(TARGET_CC) $(TARGET_CFLAGS)" LDFLAGS="$(LDFLAGS)" \
>> +             LOADLIBES="$(shell $(PKG_CONFIG_HOST_BINARY) --libs popt)" \
>
> It's not currently supported in Buildroot, but LOADLIBES is extended by
> the logrotate Makefile with -lacl or -lselinux when WITH_ACL or
> WITH_SELINUX are used. I'm not sure this will play well with your
> proposed solution.

Thanks for noticing it.
I didn't know that a variable forced from the command line cannot be extended.
Now I'm aware of it.

> But ok, this can be handled when/if someone adds ACL and/or SELinux
> support to logrotate.

Good idea.

Thanks
-- 
Fabio Porcedda
