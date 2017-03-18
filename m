From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Mar 2017 14:49:06 +0100
Subject: [Buildroot] Orphan package notification
In-Reply-To: <c221a49f-cbf8-afc0-7acc-96ef7cf242e0@mind.be>
References: <20170223170047.24417-1-arnout@mind.be>
 <20170223170047.24417-15-arnout@mind.be>
 <20170302225441.5adee9f6@free-electrons.com>
 <55bf7d15-ebeb-6bbd-1eaf-c8657c5821fb@mind.be>
 <20170317171427.03270127@free-electrons.com>
 <04a224aa-c599-d927-79ad-869dcd7d9f7c@mind.be>
 <20170318114209.123e1ea8@free-electrons.com>
 <c221a49f-cbf8-afc0-7acc-96ef7cf242e0@mind.be>
Message-ID: <20170318144906.0bc8d522@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 18 Mar 2017 14:17:55 +0100, Arnout Vandecappelle wrote:

>  Sounds good! Will you work on the getdeveloper script?

It's implemented and pushed. However, it's not in the getdeveloper
script, but instead in the daily-mail script, which is located in the
buildroot-test Git repository.

The commit log gives the details:

    daily-mail: implement orphan package notification
    
    This commit improves the notification for orphan packages, in two ways:
    
     - When a package is not associated to a developer in the DEVELOPERS
       file, Arnout is the fallback developer, and will receive
       notifications related to this package each day. In order to help
       Arnout distinguish his own packages from the orphan package a new
       column has been added in the report, which says "ORPH" if the package
       is orphaned.
    
     - The daily mail sent to the mailing list with all build failures will
       now also have the "ORPH" column, for orphan packages.
    
    This will all hopefully help us notice which packages are orphan and
    causing build issues, and see what we should do about them.

So the daily mail sent to the mailing list will now look like this:

      x86_64 |                     gdb-7.11.1 | NOK | http://autobuild.buildroot.net/results/ed8726d4cd536b81a4bca4c3d9056ad4ff2658db | ORPH
         arm |                     git-2.12.0 | NOK | http://autobuild.buildroot.net/results/561d8bfd9a98e0fdbae0e4bdf21aeea297fbf876 |     
microblazeel |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/240cfb0497b1dd7b5b33b8f64635cca435d49f05 | ORPH
         arm |                qt5webkit-5.8.0 | NOK | http://autobuild.buildroot.net/results/3792695078cf3fe7bac255a42c88d4540b5b275f |     
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/94b4281bc10856d56a7d4abcf269cb5dd584e34e |     
      xtensa |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/5828f903e4f6f548b1f537467603ce5194c95395 | ORPH
 powerpc64le |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/58422d42f8b5543539526f967d0896e4d5371e7e | ORPH
    mips64el |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/42f7c13890c4f935834c16992a6fe00b9f0e15b9 | ORPH
      xtensa |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/3a13ee820973d3cba436e7c35e1f08e90b344b12 | ORPH

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
