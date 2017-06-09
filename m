From: Hugues FRUCHET <hugues.fruchet@st.com>
Date: Fri, 9 Jun 2017 09:39:07 +0000
Subject: [Buildroot] [PATCH v1 2/2] package/libv4l: build of v4l2
 utilities on noMMU platform
In-Reply-To: <20170608215726.7d44a6c6@free-electrons.com>
References: <1496830327-5235-1-git-send-email-hugues.fruchet@st.com>
 <1496830327-5235-3-git-send-email-hugues.fruchet@st.com>
 <20170608215726.7d44a6c6@free-electrons.com>
Message-ID: <9f921390-6cb1-b650-55d2-2099c7d7445e@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 06/08/2017 09:57 PM, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 7 Jun 2017 12:12:07 +0200, Hugues Fruchet wrote:
>> Remove dependencies on MMU, dynamic libraries and locale
>>
>> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
> 
> The removal of the dependencies on MMU and dynamic library should be
> part of the previous patch, as I said in the other review.
> 
> However, the removal of the locale dependency, I'm not sure. Is it
> fixed by your previous patch? Is it already fixed in v4l ?
On my environment (STM32F4), BR2_ENABLE_LOCALE is not set but this is 
not preventing libv4l package build. It is not clear to me why this
dependency is there.

> 
> Also, you want to review all packages that "select BR2_PACKAGE_LIBV4L",
> and investigate whether we can remove the MMU/dynamic library
> dependencies on those packages.
> 
> You're lucky, there are only two such packages:
> 
> package/v4l2grab/Config.in:     select BR2_PACKAGE_LIBV4L
> package/zbar/Config.in: select BR2_PACKAGE_LIBV4L
> 
> Adjusting those packages (if applicable) can however be done in
> separate patches.
Ok I will have a look to those packages.

> 
> Thanks!
> 
> Thomas
> 
