From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Jan 2015 12:43:15 +0100
Subject: [Buildroot] [PATCH v2 5/7] Adding libwebsock
In-Reply-To: <1418398967-2183-6-git-send-email-gregd72002@gmail.com>
References: <1418398967-2183-1-git-send-email-gregd72002@gmail.com>
 <1418398967-2183-6-git-send-email-gregd72002@gmail.com>
Message-ID: <20150101124315.17f79264@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gregory Dymarek,

On Fri, 12 Dec 2014 15:42:45 +0000, Gregory Dymarek wrote:
> Signed-off-by: Gregory Dymarek <gregd72002@gmail.com>
> ---
>  package/Config.in                  |  1 +
>  package/libwebsock/Config.in       |  6 ++++++
>  package/libwebsock/libwebsock.hash |  1 +
>  package/libwebsock/libwebsock.mk   | 22 ++++++++++++++++++++++
>  4 files changed, 30 insertions(+)
>  create mode 100644 package/libwebsock/Config.in
>  create mode 100644 package/libwebsock/libwebsock.hash
>  create mode 100644 package/libwebsock/libwebsock.mk

Thanks, committed, after doing a number of changes:

[Thomas:
 - Add dependency on BR2_TOOLCHAIN_HAS_THREADS
 - Improve Config.in help text
 - Fixup comment header in .mk file.
 - Use github helper.
 - Remove hash file (we're downloading from Git)
 - Fixup LICENSE_FILES
 - Remove LIBWEBSOCK_CFLAGS, they were the default.
 - Remove LIBWEBSOCK_LIBS, and instead use a patch to switch
   libwebsock configure script to use pkg-config.]

See
http://git.buildroot.net/buildroot/commit/?id=a569dfc9db32dee4b07c56b70b8e4278f6451e6e
for the final commit.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
