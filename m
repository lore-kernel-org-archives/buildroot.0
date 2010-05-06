From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 06 May 2010 12:10:39 -0300
Subject: [Buildroot] Problem building wpa_supplicant using external
	toolchain
In-Reply-To: <i2i3e7e6aaa1005060454sda263981v97a394b1818a8c85@mail.gmail.com>
References: <i2i3e7e6aaa1005060454sda263981v97a394b1818a8c85@mail.gmail.com>
Message-ID: <4BE2DBEF.8010702@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/06/2010 08:54 AM, Marc-Andr? H?bert wrote:

> Hello,
> 
> I get an error when I try to get to building wpa_supplicant. I
> configured buildroot to use CodeSourcery Lite 2009q1.
> 
> I tried both the 2010.02 stable release and the current git source
> tree and obtained the same results.
> 
> The error I get is (I truncated the object list):
> /home/vadmin/CodeSourcery/Sourcery_G++_Lite/bin/arm-none-linux-gnueabi-gcc
> -o wpa_supplicant ... ../src/l2_packet/l2_packet_linux.o -lssl
> -lcrypto -ldl
> /home/vadmin/CodeSourcery/Sourcery_G++_Lite/bin/../lib/gcc/arm-none-linux-gnueabi/4.3.3/../../../../arm-none-linux-gnueabi/bin/ld:
> cannot find -lssl
> 
> This fails because there is no libssl.so in the CodeSourcery
> toolchain. But buildroot has built openssl just before so it is
> available somewhere. It builds just fine if I manually instruct
> wpa_supplicant to use the libssl from openssl.
> 
> Now if I understand how buildroot does things, I guess it should do
> something like this:
> -Copy libssl.so from openssl to the staging dir
> -Configure wpa_supplicant to use --sysroot with the staging dir
> -Copy the libssl.so to the target root fs
> 
> Or am I supposed to patch my external toolchain myself?
> Thank you very much
> Marc

Try this patch to see if it fixes your problem...
Regards.

-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: buildroot-wpa_supplicant-external-toolchain.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100506/bc4cfa5d/attachment.diff>
