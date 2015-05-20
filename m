From: Pascal Mazon <pascal.mazon@6wind.com>
Date: Wed, 20 May 2015 11:11:34 +0200
Subject: [Buildroot] [PATCH 1/1] ncurses: generate libtermcap
Message-ID: <555C4FC6.2030809@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I haven't had a feedback to my last answer on the subject of libtermcap 
within the ncurses package, therefore I'd like to address the issue again.

Indeed, I would prefer to have a solution upstream, rather than keeping 
a local patch.

Thank you,

Date: Mon, 27 Apr 2015 10:11:07 +0200
From: Pascal Mazon <pascal.mazon@6wind.com>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: buildroot at buildroot.org
Subject: Re: [Buildroot] [PATCH 1/1] ncurses: generate libtermcap
Message-ID: <553DEF1B.3070807@6wind.com>
Content-Type: text/plain; charset=windows-1252; format=flowed

On 04/24/2015 04:18 PM, Thomas Petazzoni wrote:
  > Dear Pascal Mazon,
  >
  > On Fri, 24 Apr 2015 14:54:26 +0200, Pascal Mazon wrote:
  >> There is no libtermcap package in buildroot, but ncurses implements
termcap
  >> natively. Furthermore, ncurses already provides the termcap.h header
file.
  >>
  >> With this patch, we fix an issue encountered with some external
toolchains
  >> that include a libtermcap.a (typically the GNU libtermcap version)
in their
  >> sysroot folder.
  >
  > Which external toolchains are in this situation?

I encountered this with a Cavium OCTEON toolchain.

  >
  >> Bash, for instance, would be linking with this libtermcap while using
  >> headers from ncurses.
  >>
  >> In order to be consistent, let's make sure there is only the ncurses'
  >> termcap library. To that effect, we:
  >> - remove any libtermcap.* in the staging dir,
  >
  > I think this should probably not be done by the ncurses package, but as
  > a post-install hook of the external toolchain.

But in that case, would it still be possible not to delete libtermcap.a
if ncurses is not selected (to still be able to link against it)?

I put this patch in the ncurses package, as the issue arises only when
it is enabled, and it is intimately associated with ncurses selection.
I've been thinking that as ncurses provides libtermcap and it is the
implementation of choice, it ought to be done there.

I've looked on Debian, the termcap.h and libtermcap.so are provided in
the libncurses-dev package itself, too.

  >
  > Thomas
  >

-- Pascal Mazon www.6wind.com

-- 
Pascal Mazon
www.6wind.com
