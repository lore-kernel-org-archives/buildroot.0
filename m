From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sat, 24 Mar 2018 22:23:45 -0500
Subject: [Buildroot] [PATCH v4 7/9] package/pkg-generic: handle
 host-ccache as a regular dependency
In-Reply-To: <20180324142008.10375-8-thomas.petazzoni@bootlin.com>
References: <20180324142008.10375-1-thomas.petazzoni@bootlin.com>
 <20180324142008.10375-8-thomas.petazzoni@bootlin.com>
Message-ID: <CANQCQpbSo-Y9mYwxS=ASviXPWPYaPVzx5=gU6YR-HmdqvrO6RA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Sat, Mar 24, 2018 at 9:20 AM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> This moves the host-ccache dependency handling from
> DEPENDENCIES_HOST_PREREQ to a proper package dependency. When
> BR2_CCACHE=y, we add host-ccache as a regular dependency of all
> packages except:
>
>  - The extractor packages host-tar, host-xz and host-lzip
>
>  - host-ccache itself
>
>  - host-skeleton, because all packages depend on it

Verified that host-ccache built after host-tar/xz/lzip and verified a
build without ccache enabled worked.

Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
