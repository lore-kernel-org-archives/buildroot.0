From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 13 Oct 2014 11:17:48 +0200
Subject: [Buildroot] [PATCHv2 1/2] getent: new package
In-Reply-To: <543A9CC0.7020802@mind.be> (Arnout Vandecappelle's message of
 "Sun, 12 Oct 2014 17:22:40 +0200")
References: <1408355649-28891-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1408355649-28891-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <543A9CC0.7020802@mind.be>
Message-ID: <87fvess4zn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 18/08/14 11:54, Thomas Petazzoni wrote:
 >> The ecryptfs-utils scripts require the 'getent' program to be
 >> installed to find the home directory of users. However, Buildroot
 >> currently never installs this program, and therefore bug #7142 was
 >> reported, explaining that ecryptfs-utils is not working properly.
 >> 
 >> In normal Linux systems, the getent program is provided by glibc, and
 >> allows to query not only /etc/passwd, but also other NSS databases
 >> such as LDAP and others.
 >> 
 >> This solution allows to install a NSS-capable getent when glibc/eglibc
 >> is used, and otherwise to rely on uClibc's wrapper script.
 >> 
 >> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 > Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 >  Fixes a (run-time) bug, so please apply.

We have some autobuild issues, like:

http://autobuild.buildroot.net/results/820/8207527e3e42a226649c5f5fbf62fa8a77b89467/

(codesourcery mips 2013.05)

Should we perhaps fallback to the uClibc emulation version if the
toolchain doesn't provide it?

-- 
Bye, Peter Korsgaard
