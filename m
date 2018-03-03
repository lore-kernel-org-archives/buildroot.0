From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 2 Mar 2018 21:32:44 -0600
Subject: [Buildroot] RFC: cpe-info and utils/scancpe
Message-ID: <CANQCQpZkV_eVMFB-W5UeTt8VTLPvxgnWurN-5TfCqqDG4+19hA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I started a pull request for these changes so I could capture the
infra/scripting as well as an initial set of CPE ID tweaks.  Feel free
to comment on the commits or here.

https://github.com/buildroot/buildroot/pull/32

Changes since v1/v2
- Includes script to determine if CPEs are valid and which ones need
version updating vs created at NIST
- Figured out I could just retrieve the raw xml and search it vs using
a offline software to do it.  It makes the script usable immediately
by anyone (pardon my bad python skills)
- make cpe-info, defaults to all packages creating an entry using the
package name for vendor:name of the CPE
- All changes incorporated from emails and change logs updated.


TODO
- Have script generate a suggested submission to NIST for bumps and
new CPEs.  Filling in as much information as we can using buildroot's
package variables
- Add CPE missing/needs update analysis to pkg-stats
- looks at complete buildroot system CPE reports and see if there are
cornercases I don't see with a set of ~90 packages
- Figure out plan for hash based versions and if we just suggest to
register those in NIST for major buildroot revs?
- Figure out if once we get cached git repos, if we can mine that repo
for last tag and use that to help construct a major/minor CPE version
- Document CPE submission process to NIST
- Automate pkg maintainer notifications to take action on package
bumps were we need to update NIST.  This assumes we don't just send an
automated email to NIST vs provide the maintainer with a pretty close
email template they can just send.
- Look at host pkg-stats tracks hash based versions


Matt
