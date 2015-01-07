From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Jan 2015 21:39:40 +0100
Subject: [Buildroot] [PATCH 1/1] qt5cinex: Add new
 Qt5CinematicExperience package.
In-Reply-To: <1420640541-29637-1-git-send-email-pierre.lemagourou@openwide.fr>
References: <1420640541-29637-1-git-send-email-pierre.lemagourou@openwide.fr>
Message-ID: <20150107213940.40b78504@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  7 Jan 2015 15:22:21 +0100, pierre.lemagourou at openwide.fr wrote:
> From: Pierre Le Magourou <pierre.lemagourou@openwide.fr>
> 
> Signed-off-by: Pierre Le Magourou <pierre.lemagourou@openwide.fr>

Thanks, applied, after doing a number of additional changes:

    [Thomas:
     - Change the dependency logic in the Config.in file. We don't want to
       have a 'depends on BR2_PACKAGE_QT5GRAPHICALEFFECTS': it should be
       selected automatically. Instead, let's have a dependency on Qt5 and
       OpenGL, and select everything else automatically. A comment is
       added, shown only when Qt5 is available, on the right platforms
       (which have JSCore support), to explain that we need an OpenGL
       backend.
     - Change the prompt of the package to be qt5cinex, to match the
       package name.
     - Replace "High-definition support" by "High-definition version".
     - Fix a typo in the Config.in help text: definifition -> definition.
     - Add a comment in the .mk file explaining why we install a wrapper
       shell script (explanation taken from Pierre's e-mail).
     - Fix indentation in the install target commands.
     - Keep only sha256 hashes, those are sufficient. Replace the comment
       in the hash file by the more traditional "Locally computed".]

If you could test the latest Buildroot master (which has your patch
applied) and check that everything works fine, it would be great.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
