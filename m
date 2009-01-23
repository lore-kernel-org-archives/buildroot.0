From: QuickX <quickx@hotmail.com>
Date: Fri, 23 Jan 2009 11:38:55 -0800
Subject: [Buildroot] Some AT91SAM9261-EK Notes
In-Reply-To: <1232722423.5311.70.camel@elrond.atmel.com>
References: <BAY124-W491126D3265E8BD9DCF5DCD2CE0@phx.gbl>
	<1232722423.5311.70.camel@elrond.atmel.com>
Message-ID: <BAY124-DS41A02756B01D8CBA35C29D2CF0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Can you  build uclibc-0.9.30 with ?uclibc-0.9.29.config without
> updating configuration item.
>
> Maybe you can provide a diff between the resulting .config
> and the ?uclibc-0.9.30.config

I built the project with uClibc-0.9.30 (0.9.29.config), and then build 
project with uClibc-0.9.30 (0.9.30.config).  Here are the differences in the 
generated "toolchain_build_arm/uClibc-0.9.30/.config"'s.  I TABed the Items 
that didn't show up in the counterpart config.

---uClibc 0.9.30 (with 0.9.29.config); Working; Took Default for Questions 
Asked During Build---
# FORCE_SHAREABLE_TEXT_SEGMENTS is not set
LDSO_CACHE_SUPPORT=y
	LDSO_BASE_FILENAME="ld.so"
# UNIX98PTY_ONLY is not set
UCLIBC_HAS_GETPT=y
# UCLIBC_USE_NETLINK is not set
UCLIBC_HAS_STRING_GENERIC_OPT=y
UCLIBC_HAS_STRING_ARCH_OPT=y
UCLIBC_HAS_CTYPE_CHECKED=y
# UCLIBC_HAS_CTYPE_ENFORCED is not set
UCLIBC_HAS_STDIO_GETC_MACRO=y
UCLIBC_HAS_STDIO_PUTC_MACRO=y
UCLIBC_HAS_GNU_GETSUBOPT=y
UCLIBC_HAS_REGEX_OLD=y
UCLIBC_HAS_FNMATCH_OLD=y
# UCLIBC_HAS_ARC4RANDOM is not set


---uClibc 0.9.30 (with 0.9.30.config); Not Working; Didn't Ask Any Questions 
During Build---
FORCE_SHAREABLE_TEXT_SEGMENTS=y
# LDSO_CACHE_SUPPORT is not set
UNIX98PTY_ONLY=y
# UCLIBC_HAS_GETPT is not set
UCLIBC_USE_NETLINK=y
	UCLIBC_SUPPORT_AI_ADDRCONFIG=y
# UCLIBC_HAS_STRING_GENERIC_OPT is not set
# UCLIBC_HAS_STRING_ARCH_OPT is not set
# UCLIBC_HAS_CTYPE_CHECKED is not set
UCLIBC_HAS_CTYPE_ENFORCED=y
# UCLIBC_HAS_STDIO_GETC_MACRO is not set
# UCLIBC_HAS_STDIO_PUTC_MACRO is not set
# UCLIBC_HAS_GNU_GETSUBOPT is not set
# UCLIBC_HAS_REGEX_OLD is not set
# UCLIBC_HAS_FNMATCH_OLD is not set
UCLIBC_HAS_ARC4RANDOM=y


My guess is that it's the "UCLIBC_USE_NETLINK" option since it looks like 
only networky applications are affected (dropbear, samba, etc).  I'm 
actually catching a plane in 8 hours and will be gone for a week, however, I 
can try to test the options one by one if you can't tell what it is from 
just the diff.

I also attached both the generated config files if they are helpful.  I 
wasn't too sure what "without updating configuration items" meant, is it an 
option somewhere? 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: Working Generated uClibc.config
Type: application/xml
Size: 5982 bytes
Desc: not available
Url : http://lists.busybox.net/pipermail/buildroot/attachments/20090123/5de0861b/attachment-0002.xml 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: NotWorking Generated uClibc.config
Type: application/xml
Size: 6061 bytes
Desc: not available
Url : http://lists.busybox.net/pipermail/buildroot/attachments/20090123/5de0861b/attachment-0003.xml 
