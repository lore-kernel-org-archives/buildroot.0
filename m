From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Nov 2012 00:11:54 +0100
Subject: [Buildroot] Problem building libglib2
In-Reply-To: <50B7C54C.3010103@mind.be>
References: <CAE21AQquyvDfegH5f8FebeE8LFTnOY3r75Yuy6ZpWs72uD80MQ@mail.gmail.com>
 <201211300652.45293.manningc2@actrix.gen.nz>
 <20121129190813.5dc97298@skate>
 <201211300731.53056.manningc2@actrix.gen.nz>
 <50B7C54C.3010103@mind.be>
Message-ID: <20121130001154.129b9238@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thu, 29 Nov 2012 21:27:56 +0100, Arnout Vandecappelle wrote:

>   We could obviously solve this by unexporting PKG_CONFIG_SYSROOT_DIR, but
> perhaps the better approach is to remove those environment variables from our
> custom pkgconf?

No, we use PKG_CONFIG_SYSROOT_DIR="/" when we build packages for the
host, so we can't simply remove support for the PKG_CONFIG_SYSROOT_DIR
environment variable. Unexporting PKG_CONFIG_SYSROOT_DIR sounds like
the good solution here.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
