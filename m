From: Christian Stewart <christian@paral.in>
Date: Thu, 13 Aug 2020 13:20:44 -0700
Subject: [Buildroot] [PATCH 1/4] package/mender-artifact: bump version
 to 3.4.0
In-Reply-To: <CAFSsvmrrpXkZNcmwy5ukrX4k2XqPGp-kQpNxqq=PN+mG+ir0Tw@mail.gmail.com>
References: <20200715173707.584226-1-aduskett@gmail.com>
 <20200811235833.03115c8b@windsurf.home>
 <CA+h8R2qLY-5FbL_HTjwTH_i=w3ky_=C=17n48_=18-E=9mUYVg@mail.gmail.com>
 <20200812102236.631c057f@windsurf.home>
 <CAFSsvmqzkM2N2syEMc1AZeeRdvQ-HRtkK4zFSOp3q-qumYmCKQ@mail.gmail.com>
 <CA+h8R2oxbeA9Fcfs-aEjpWb_4QC7WbijYW5hm84GAvC3iWP00w@mail.gmail.com>
 <CAFSsvmrrpXkZNcmwy5ukrX4k2XqPGp-kQpNxqq=PN+mG+ir0Tw@mail.gmail.com>
Message-ID: <CA+h8R2qOfg8H7OgTgrCRHrsq1WyNua4C8H1+Pd2a4Aio31D7iA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adam,

On Thu, Aug 13, 2020 at 1:04 PM Adam Duskett <aduskett@gmail.com> wrote:
> Just as a note, the go-modules series breaks mender-artifact, and the
> .mk file needs to be modified
> to add a "./" before cli/mender-artifact.
> IE:
> HOST_MENDER_ARTIFACT_BUILD_TARGETS = ./cli/mender-artifact

The series needs a few adjustments for host-go packages... I'm doing a
small cleanup + testing pass and will submit a new revision today,
including a patch adjusting the host-mender package build target.

Note:

I recommend changing the SITE to

HOST_MENDER_ARTIFACT_SITE = $(call
github,mendersoftware,mender-artifact,$(HOST_MENDER_ARTIFACT_VERSION))

corresponding hash:

sha256  c085479a6e2ae598687a15b646bfaaa68e5d76d08382bdcc4a27a9b4021d6540
 mender-artifact-3.4.0.tar.gz

(vs 3.4.0.tar.gz filename before).

After the new series revision it will be:

HOST_MENDER_ARTIFACT_BUILD_TARGETS =
github.com/mendersoftware/mender-artifact/cli/mender-artifact

Best regards,
Christian
