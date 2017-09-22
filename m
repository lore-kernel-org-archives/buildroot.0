From: Wolfgang Grandegger <wg@grandegger.com>
Date: Fri, 22 Sep 2017 20:52:50 +0200
Subject: [Buildroot] [PATCH v2] package/dfu-util: allow to build it for
 the target as well
In-Reply-To: <b70e4712-d1c5-08b1-415a-00b9d86f1061@mind.be>
References: <339edb91-644e-2456-b627-262d81c1afaa@grandegger.com>
 <b70e4712-d1c5-08b1-415a-00b9d86f1061@mind.be>
Message-ID: <a0102284-e32b-8a33-c427-1fda3bcc4baf@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Am 22.09.2017 um 13:32 schrieb Arnout Vandecappelle:
> 
> 
> On 22-09-17 09:11, Wolfgang Grandegger wrote:
>> +config BR2_PACKAGE_DFU_UTIL
>> +	bool "dfu-util"
>> +	select BR2_PACKAGE_LIBUSB
> 
>   As I mentioned in my first reply, you also need to propagate libusb's
> dependency on threads and the corresponding comment.

Then I have obviously not understood your comment. Looking into 
"package/libusb/Config.in":


         depends on BR2_TOOLCHAIN_HAS_THREADS

comment "libusb needs a toolchain w/ threads"
         depends on !BR2_TOOLCHAIN_HAS_THREADS

I will add  similar lines in "dfu-util".

Wolfgang.
