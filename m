From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 26 Feb 2014 11:06:44 +0000
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140221100842.2d988a70@skate>
References: <20140221073009.2E62F10136B@stock.ovh.net>
 <20140221100842.2d988a70@skate>
Message-ID: <530DCAC4.90908@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/21/2014 09:08 AM, Thomas Petazzoni wrote:
>>        mips |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/95cac37ef8f035c024ebcd808367739c29875f30/
>
> /home/test/test/3/output/host/opt/ext-toolchain/bin/../lib/gcc/mips-linux-gnu/4.7.3/../../../../mips-linux-gnu/bin/ld: ./.libs/libvlc_srtp.a(libvlc_srtp_la-srtp.o): relocation R_MIPS_26 against `div' can not be used when making a shared object; recompile with -fPIC
> ./.libs/libvlc_srtp.a(libvlc_srtp_la-srtp.o): could not read symbols: Bad value
> collect2: error: ld returned 1 exit status
>
> We have the same problem on x86-64: some vlc library is apparently not
> build with -fPIC. Could someone look into this?
>
> It has caused the last 3 build failures of vlc on mips:
>
>   http://autobuild.buildroot.org/?reason=vlc-2.1.2&arch=mips&step=3
>
> and the four last build failures of vlc on x86-64:
>
>   http://autobuild.buildroot.org/results/a53/a53ea017ec92150c7d37c0da0ca9a8dac75f460e/build-end.log

After compiling libgcrypt with -fPIC, the error has changed to this one:

/home/test/test/3/output/host/opt/ext-toolchain/bin/../lib/gcc/mips-linux-gnu/4.7.3/../../../../mips-linux-gnu/bin/ld: 
./.libs/libunzip.a(unzip.o): relocation R_MIPS_26 against `a local 
symbol' can not be used when making a shared object; recompile with -fPIC

I don't know if this is an improvement or not, and I don't know what to 
do next :/

Maybe someone else has more ideas.

-- 
Vincent
