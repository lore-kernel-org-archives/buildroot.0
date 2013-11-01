From: Jan Pohanka <xhpohanka@gmail.com>
Date: Fri, 01 Nov 2013 07:52:16 +0100
Subject: [Buildroot] iconv: additional encodings
In-Reply-To: <0e99777a-09bf-4414-9769-cbfdd10aa040@email.android.com>
References: <52725222.9050503@gmail.com>
 <CABMiYf_=RK0UJyZLNkW5JU3xSXKMcNxL9-VRxjNpFqtZ3ye50g@mail.gmail.com>
 <0e99777a-09bf-4414-9769-cbfdd10aa040@email.android.com>
Message-ID: <52734FA0.3060508@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dne 31.10.2013 21:38, Thomas De Schampheleire napsal(a):
> Hi Jan,
>
> Jan Pohanka <xhpohanka@gmail.com> wrote:
>> I will answer myself: GCONV_PATH variable is the solution. It must
>> point into /usr/lib/gconv!
>
> If you are talking about the host /usr then I think this is not correct. Buildroot should not depend on such files from the host.
>
> Can you find the right files inside output/host ? The files coming from the external toolchain are in output/host/opt.
>

Hi Thomas,

I have realized that external toolchain support is a bit patched in the 
fork that I'm using compared to original one. There is an option to copy 
files gconv-modules, gconv-modules.cache, CP1250.so, and all other 
encodings shared libraries to target/usr/lib/gconv directory. I thought 
that it is a standard directory which the glibc iconv implementation 
would search shared encodings for. This is not truth because GCONV_PATH 
has to be set and point there, to make iconv work with all encodings.

Maybe something similar could be added to standard Buildroot. It took me 
a day to realize where is the problem.

with best regards
Jan
