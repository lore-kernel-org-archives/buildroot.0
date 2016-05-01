From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 May 2016 13:59:43 +0200
Subject: [Buildroot] [PATCH v2] toolchain: add a harmless link when
 sysroot detection is not accurate
In-Reply-To: <a96a4788-f871-3fe0-4887-29d77489dc73@gmail.com>
References: <1453475155-49586-1-git-send-email-Vincent.Riera@imgtec.com>
 <56B08B91.5080704@imgtec.com> <56B0BB7E.7020305@gmail.com>
 <56B0C7DE.1030400@imgtec.com> <56B0CB8D.2030306@gmail.com>
 <a96a4788-f871-3fe0-4887-29d77489dc73@gmail.com>
Message-ID: <20160501135943.6e4d4f40@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Apr 2016 21:27:33 +0200, Romain Naour wrote:

> >> Well, the whole point for this patch [1] was to get rid of that hook (which was
> >> the first approach when I sent the patches to add the Codescape toolchains) and
> >> add that functionality in the toolchain infra just in case more toolchains with
> >> this problem were added in the future.  
> > 
> > I understand, let see what maintainers says.  
> 
> Like for CodeSourcery AArch64 toolchain recently [1], what about adding a
> post-install hook instead ?
> 
> [1]
> https://git.busybox.net/buildroot/commit/?id=4d39ca1c2ab19766abf0430abe9b65ba0e16602b

Yeah, I don't know. There's a trade-off here:

 - By having the logic in the common external toolchain logic, it's
   usually more complicated, but at least it works for "custom"
   external toolchains as well.
  
 - By having a custom logic only for this toolchain, it's usually much
   simpler, but it doesn't work for custom external toolchains.

Not easy to decide which approach is the most appropriate.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
