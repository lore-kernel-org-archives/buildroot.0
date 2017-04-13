From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Thu, 13 Apr 2017 08:05:04 +0200
Subject: [Buildroot] [Patch v4 3/3] rust: new package
In-Reply-To: <174ded3e-cc52-0456-3cd2-7750c531e442@mind.be>
References: <20170402194651.28684-1-eric.le.bihan.dev@free.fr>
 <20170402194651.28684-4-eric.le.bihan.dev@free.fr>
 <1491549522.26127.8.camel@embedded.rocks> <20170408100925.GC32154@itchy>
 <1491850965.4279.1.camel@embedded.rocks>
 <174ded3e-cc52-0456-3cd2-7750c531e442@mind.be>
Message-ID: <1492063504.4490.1.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, 2017-04-10 at 23:43 +0200, Arnout Vandecappelle wrote:
> 
> On 10-04-17 21:02, J?rg Krause wrote:
> > Hi,
> > 
> > On Sat, 2017-04-08 at 12:09 +0200, Eric Le Bihan wrote:
> 
> [snip]
> > > Currently Buildroot only offers downloading binary versions of the C/C++
> > > cross-compilers. It does not take into account alternative C/C++
> > > cross-compilers like LLVM/Clang or compilers for new languages like
> > > Rust, D, or Haskell (though I do not know if Haskell is useful on
> > > embedded systems).
> 
>  There's a huge difference between alternative C/C++ compilers and compilers for
> other languages.
> 
>  Compilers for other languages we already have: python, mono, erlang. These are
> just normal packages, and any package in that language depends on the host-xxx
> package to provide the compiler. Similar to how packages that use the cmake
> buildsystem depend on the host-cmake package.
> 
>  Alternative C/C++ compilers are something else entirely, because they replace
> the special 'toolchain' target.
> 
>  Only when you can build an entire system with only the Rust compiler and
> without C/C++ compiler you can consider them equivalent. That day is still far away.

I see!

> > For now, we could use the host rustc package to fetch the latest stable
> > binary for the host architecture. Additionally, we could add the option
> > to build the Rust compiler within Buildroot. In my opinion, this option
> > only makes sense if the compiler can be configured meaningfully.
> 
>  I agree.

Cool.

@Eric: Do you mind to do that? By default fetch the latest stable
release, and alternatively offer an option to build a "Custom Rust
package". I think it would also be helpful to have at least one Rust
package to add as a proof of concept.

> 
> > > So, would it help to have a "Programming Languages" section in
> > > menuconfig where you can select Rust (or any other language) and choose
> > > between a using a pre-built compiler or build it from source?
> > 
> > In my opinion it would make more sense to have a menu "Toolchains" with
> > the submenus "C/C++ Toolchain", "Rust Toolchain", ...
> 
>  Given what I wrote above, I disagree. For the time being it's fine in the host
> packages menu. If that menu becomes too large, we could add something like an
> 'Alternative programming languages' menu.
> 

Sounds reasonable.

> 
> > > And where shoud LLVM/clang be exposed?
> > 
> > I would put it into "C/C++ Toolchain" (if we had such a menu).
> 
>  That's slightly more complicated. LLVM is just a library so it's just in the
> host menu. clang is a compiler that can be a replacement for gcc, so it'd have
> to go into the toolchain menu.
> 
>  Actually, Romain is working on LLVM/Clang. He's going to start adding it as a
> normal host package, so not as a replacement of gcc as the toolchain.

Nice!

J?rg
