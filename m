From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 18 Nov 2018 19:48:26 -0600
Subject: [Buildroot] [PATCH v2 2/6] package/llvm: install target
 binary/debug tools
In-Reply-To: <50862e38-68c7-e166-a719-82ab28f7aad9@smile.fr>
References: <1542426982-54683-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1542426982-54683-2-git-send-email-matthew.weber@rockwellcollins.com>
 <50862e38-68c7-e166-a719-82ab28f7aad9@smile.fr>
Message-ID: <CANQCQpbU9jTkv9L8B80o+k2x_sAtDVOhhE9KFjUXA_nVuV=ang@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Sun, Nov 18, 2018 at 1:14 PM Romain Naour <romain.naour@smile.fr> wrote:
>
> Hi Matt,
>
> Le 17/11/2018 ? 04:56, Matt Weber a ?crit :
> > The compiler-rt fuzzer and address sanitizer tools require additional
> > LLVM binary tools installed to allow stack trace decoding actively during
> > executable analysis.
> >
> > https://github.com/google/sanitizers/wiki/AddressSanitizerCallStack
> >
> > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> > Reviewed-by: Romain Naour <romain.naour@smile.fr>
>
> For some reason I get an error while building llvm package tools.
>
> x86_64-linux-g++: WARNING: unsafe header/library path used in cross-compilation:
> '-I/usr/include/libxml2'
>
> Can you have a look?

I went back and checked my logs on the clang compiler-rt run-test
build for that warning and didn't find it.  I then checked and my
config and it has the unsafe header/library as error.  Was your build
test just applying my patches and doing an explicit 'make llvm'?

Thanks
Matt
