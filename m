From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 31 May 2018 00:28:27 +0200
Subject: [Buildroot] Buildroot host-clang error
In-Reply-To: <CAMWSM7hj7MYpm3V6=wD8X4hJcKpE1+cwQh9cCX7Yv=018s-Zzw@mail.gmail.com>
References: <CAMWSM7hj7MYpm3V6=wD8X4hJcKpE1+cwQh9cCX7Yv=018s-Zzw@mail.gmail.com>
Message-ID: <ee77a8dc-41d0-d3f3-6e62-311a59a9fcfa@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Joseph,

Le 30/05/2018 ? 23:52, Joseph Kogut a ?crit?:
> Hi Valentin,
> 
> I'm working on a package for Buildroot that requires Clang to compile,
> and I'm running into an issue.
> 
> Upon invoking the built compiler, even without options, I get:
> 
> : CommandLine Error: Option 'x86-use-base-pointer' registered more than once!
> LLVM ERROR: inconsistency in registered CommandLine options
> 
> This is using the current master branch, including LLVM and Clang 5.0.2.
> 
> By experimenting, I found that disabling the shared libLLVM
> (-DLLVM_LINK_LLVM_DYLIB=OFF), the compiler works again.
> 
> Is this a known issue? Do you have any suggestions?

Yes it is, see: http://patchwork.ozlabs.org/patch/922738/

Can you test the patch and report if it fix your issue.

Best regards,
Romain

> 
> Thanks,
> Joe
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
