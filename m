From: Mike Frysinger <vapier@gentoo.org>
Date: Thu, 20 Jun 2013 19:21:48 -0400
Subject: [Buildroot] Recurrent Blackfin build failure on icu
In-Reply-To: <CAJxxZ0NqXVjrO9_d6mYALXP6ktvLMxXFyc--RS9y9GVm5UkE7Q@mail.gmail.com>
References: <20130529213510.43fc1372@skate> <20130603113857.0c7ff74a@skate>
 <CAJxxZ0NqXVjrO9_d6mYALXP6ktvLMxXFyc--RS9y9GVm5UkE7Q@mail.gmail.com>
Message-ID: <201306201921.49209.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 05 June 2013 22:32:27 Sonic Zhang wrote:
> On Mon, Jun 3, 2013 at 5:38 PM, Thomas Petazzoni wrote:
> > On Mon, 3 Jun 2013 17:26:08 +0800, Sonic Zhang wrote:
> >> For historic reasons, Blackfin GNU toolchain generate assembly symbols
> >> with the prefix '_'. For example: _uconvmsg_dat and _icudt48_dat .
> >> But, the pkgdata tool in icu doesn't generate assembly file
> >> uconvmsg_dat.s and icudt48l_dat.s in this way when Blackfin GNU
> >> toolchain is used. What do you think is a better way to fix it?
> > 
> > Can this specific behavior of the Blackfin toolchain be detected? Is
> > there a typical autotools test that would allow to test this?
> 
> Maybe you can check the symbol name after compiling a C file into an
> assembly file?

gcc provides __USER_LABEL_PREFIX__ specifically for this.  but you'd have to 
create a .S file and run it through the preprocessor to do that ...
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130620/c44662b3/attachment.asc>
