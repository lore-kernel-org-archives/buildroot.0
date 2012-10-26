From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 27 Oct 2012 01:05:07 +0200
Subject: [Buildroot] post-buil script in chrooted
In-Reply-To: <508AF8EF.4070002@free.fr>
References: <5077A820.7050202@free.fr> <20121012093032.7ef6b972@skate>
 <CAAXf6LVCr25_i_6CMR6DYs-5z1+bVuNNYEF4DedEe3j-6=4hqg@mail.gmail.com>
 <507866D6.8020608@mind.be> <507C882B.5080609@free.fr>
 <507F15D3.2080805@mind.be> <508AF8EF.4070002@free.fr>
Message-ID: <508B1723.80503@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26/10/12 22:56, David Bonnin wrote:
> Exactly, i want to create few users on the target, and copy files for each user, like ftpUser , httpdUser, userMyApp,
> userMyBackupApp.
> I doesn't want to copy files only for root.
>
> My apps(2) on the target doesn't run under root privileveges, and have theirs own default files/directory.

  If you want to set file owners and permissions on the target, you should use
the device table (BR2_ROOTFS_DEVICE_TABLE).  Look at
target/generic/device_table.txt for an example.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
