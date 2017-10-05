From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 05 Oct 2017 21:46:58 +0200
Subject: [Buildroot] [PATCH] wireguard: needs 3.10+ kernel
In-Reply-To: <0b87fcfb-da25-7574-3c7e-e3929383df71@mind.be> (Arnout
 Vandecappelle's message of "Thu, 5 Oct 2017 20:44:47 +0200")
References: <20171003080448.3809-1-peter@korsgaard.com>
 <0b87fcfb-da25-7574-3c7e-e3929383df71@mind.be>
Message-ID: <8760btidhp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 >  Hi Peter,
 >  Looks like I don't manage to apply any of your patches today :-)

 > On 03-10-17 10:04, Peter Korsgaard wrote:
 >> The dependency is actually only for the kernel module (and thus on the
 >> runtime kernel version rather than kernel headers), but as we don't know the
 >> runtime version in kconfig this will have to do.
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> ---
 >> package/wireguard/Config.in | 4 ++++
 >> 1 file changed, 4 insertions(+)
 >> 
 >> diff --git a/package/wireguard/Config.in b/package/wireguard/Config.in
 >> index 0321755db3..acce6663ba 100644
 >> --- a/package/wireguard/Config.in
 >> +++ b/package/wireguard/Config.in
 >> @@ -1,5 +1,6 @@
 >> config BR2_PACKAGE_WIREGUARD
 >> bool "wireguard"
 >> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10

 >  The kernel module is only built if BR2_LINUX_KERNEL=y, so shouldn't this be

 > 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 || !BR2_LINUX_KERNEL

That was my first thought as well, but it doesn't make much sense to
build the user space part if the kernel is too old, and I couldn't come
up with a good and clear wording for the comment - So I opted to keep it
simple.

But we can change it if you feel strongly about it. What do you suggest
for the comment text?

 > ? And of course in the comment as well.

 >  In addition, I think you should add the (abbreviated) contents of the commit
 > message as a comment here, otherwise it's not at all clear.

Ok, I can do that when applying.

-- 
Bye, Peter Korsgaard
