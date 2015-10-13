From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Oct 2015 23:04:55 +0200
Subject: [Buildroot] [PATCH v3] libv4l: bump version to 1.8.0
In-Reply-To: <20151013212534.16949f70@gmx.net>
References: <1444678106-24045-1-git-send-email-ps.report@gmx.net>
 <20151012213955.6bca036c@free-electrons.com>
 <20151013212534.16949f70@gmx.net>
Message-ID: <20151013230455.54951631@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Tue, 13 Oct 2015 21:25:34 +0200, Peter Seiderer wrote:

> If 'ifeq ($(BR2_PACKAGE_QT5BASE)$(BR2_PACKAGE_QT5BASE_GUI)$(BR2_PACKAGE_QT5BASE_WIDGETS),yyy)'
> is enough this line could be shorten to 'else ifeq ($(BR2_PACKAGE_QT_GUI_MODULE),y)' or
> is it better/clearer to add '$(BR2_PACKAGE_QT5)' to the first one ( I think both
> options will work)?

Yeah, indeed the Qt4 test can be limited to BR2_PACKAGE_QT_GUI_MODULE,
since if this symbol is enabled, surely BR2_PACKAGE_QT is as well.
Though I found it more explicit to also indicate BR2_PACKAGE_QT, even
if not strictly necessary.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
