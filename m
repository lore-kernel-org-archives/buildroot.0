From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Jul 2017 21:09:32 +0200
Subject: [Buildroot] Build failure with 2017.05.1
In-Reply-To: <1662234505.617742.1500487581506.JavaMail.zimbra@datacom.ind.br>
References: <1662234505.617742.1500487581506.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20170719210932.59467c37@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Jul 2017 15:06:21 -0300 (BRT), Carlos Santos wrote:
> I got this error while building protobuf with Buildroot 2017.05.1:
> 
> >>> host-protobuf 3.2.0 Downloading  
> [...]
> --2017-07-18 17:30:20--  https://github.com/google/protobuf/commit/416f90939d4de58fe1a4e2489120010313183291.patch
> [...]
> ERROR: 416f90939d4de58fe1a4e2489120010313183291.patch has wrong sha256 hash:
> ERROR: expected: da80c39838515913633f4cbd875fdd4ad711be95c83a50ff5096b9f1254033b3
> ERROR: got     : 61e5b65b65e10f3ae7549b3a38eb30162ef298e387b1779d997ddf3633d63700
> ERROR: Incomplete download, or man-in-the-middle (MITM) attack
> 
> Looks like the "patches downloaded from Github are not stable"
> issue already fixed by Thomas Petazzoni in several recipes.
> 
> I solved the problem by means of a local change that brings
> the patch in the tree.
> 
> Should I submit a patch specific for the 2017.05.x branch or it
> would be preferable to cherry-pick the commits that bump protobuf
> to v3.3.0 from master to 2017.05.x?

We definitely don't want the bump to v3.3.0 in the maintenance branch,
unless there are security fixes associated.

However, I think we want to do in 2017.02.x and 2017.05.x what we did
in master: remove all Github patch downloads, and put the patches in
the tree instead. For most of the packages, I believe the commits can
be cherry-picked from master. A few packages will need specific
adjustments though.

Peter, do you agree?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
