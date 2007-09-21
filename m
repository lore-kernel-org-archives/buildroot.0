From: Babarovic Ivica <ivica.babarovic@asist.si>
Date: Fri, 21 Sep 2007 10:57:21 +0200
Subject: [Buildroot] [Re:  fakeroot fails to build]
Message-ID: <46F38771.9090204@asist.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer wrote:

> On Thu, Sep 20, 2007 at 07:25:40PM +0200, Bernhard Fischer wrote:
>   
>> On Thu, Sep 20, 2007 at 05:50:47PM +0200, Bernhard Fischer wrote:
>>     
>>> On Thu, Sep 20, 2007 at 05:22:42PM +0200, Babarovic Ivica wrote:
>>>       
>>>> Hi!
>>>>
>>>> It seem fakeroot fails to build for my powerpc target.
>>>>         
>>> Please show me your
>>> $ egrep "^[^#]*(_GCC|LARGE|UCLIBC)" .config
>>>       
>> fakeroot is broken if LFS is off. Enable largefile support and/or fix
>> fakeroot upstream.
>>     
>
> Alright. Please do a
> $ svn up
> $ mv package/fakeroot/fakeroot-uclibc-LFS.diff \
> package/fakeroot/fakeroot-uclibc-LFS.patch
> $ make fakeroot-clean fakeroot-dirclean host-fakeroot-dirclean
> $ make fakeroot
>
> Any better?
>
>
>   
No. Not much better. Stil looks like the same error.

$ egrep "^[^#]*(_GCC|LARGE|UCLIBC)" .config
BR2_GCC_TARGET_TUNE="603e"
BR2_UCLIBC_VERSION_0_9_29=y
BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.29.config"
BR2_GCC_VERSION_4_2_1=y
BR2_GCC_VERSION="4.2.1"
BR2_EXTRA_GCC_CONFIG_OPTIONS=""
BR2_GCC_CROSS_CXX=y
BR2_GCC_SHARED_LIBGCC=y
BR2_LARGEFILE=y

I did:

$ svn up
$ mv package/fakeroot/fakeroot-uclibc-LFS.diff \
package/fakeroot/fakeroot-uclibc-LFS.patch
$ make fakeroot-clean fakeroot-dirclean host-fakeroot-dirclean
$ make fakeroot

Svn Revision: 19923

I've attached the error.


-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: error
Url: http://busybox.net/lists/buildroot/attachments/20070921/22d3a709/attachment.diff 
