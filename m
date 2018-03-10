From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Mar 2018 09:43:47 +0100
Subject: [Buildroot] [git commit] tpm2-tss: new package
In-Reply-To: <497594174.1292740.1520644151438.JavaMail.zimbra@datacom.ind.br>
 (Carlos Santos's message of "Fri, 9 Mar 2018 22:09:11 -0300 (BRT)")
References: <20180308090237.C2C4582814@busybox.osuosl.org>
 <1431823865.1093060.1520538814142.JavaMail.zimbra@datacom.ind.br>
 <878tb1hrf8.fsf@dell.be.48ers.dk>
 <497594174.1292740.1520644151438.JavaMail.zimbra@datacom.ind.br>
Message-ID: <87r2oscocc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.ind.br> writes:

 >> Thomas asked on IRC why this was x86 only. Can you explain why?

 > Because it needs a hardware TPM, which as far as I know is available
 > only in some Intel processors (I tested it in a C3000 SOC).

Aren't TPM2 devices still available as small microcontrollers connected
to the main processor over i2c/spi? I've seen ARM boards with such
TPM1.2 devices, and I think Thomas mentioned an ARM board with a TPM2
device connected over SPI.

In general, unless there is a build time dependency on architecture
specific files or the package is very specific to a SoC or board I
prefer to not hide packages, even if it is unlikely to be used on other
architectures.

So I think we should remove the dependencies from tpm2-tss.

-- 
Bye, Peter Korsgaard
