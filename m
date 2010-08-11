From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Aug 2010 13:15:30 +0200
Subject: [Buildroot] Linux from file in buildroot with external toolchain
In-Reply-To: <BLU0-SMTP746AC14EB6D66389DECA50E7D90@phx.gbl>
References: <BLU0-SMTP746AC14EB6D66389DECA50E7D90@phx.gbl>
Message-ID: <20100811131530.39a0f6b2@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 11 Jun 2010 14:56:35 +0200
"Andy Gibbs" <andyg1001@hotmail.co.uk> wrote:

> I am using buildroot 2010.05 with an external toolchain (actually 
> crosstool-ng) and I am finding it very difficult to find the setting to take 
> the linux source code from a local file.  If I use the buildroot toolchain 
> instead, then under the Toolchain menu and Kernel Headers sub-menu I can 
> select a local linux snapshot and then, under the Kernal menu select to use 
> the same linux version as used for the headers.  This works.
> 
> However, when using the external toolchain, it doesn't seem possible to do 
> this -- I expect that I have missed something really obvious, but a good 
> while Googling, trying things and failing, and I can't find it.
> 
> Can anyone point me right?

Well, if you're using an external toolchain, then the selection of
which kernel headers to use when building the toolchain is done when
building the external toolchain (i.e, in your case, inside Crosstool
NG). Once the toolchain is built, you cannot change the kernel headers
used to build the toolchain, which explains why Buildroot does not
offer such an option when using an external toolchain.

However, you can still select whichever kernel version you want for the
real kernel build.

Does this answers your question ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
