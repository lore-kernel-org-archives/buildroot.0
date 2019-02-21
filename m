From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Feb 2019 11:24:10 +0100
Subject: [Buildroot] [PATCH] package/mosquitto: security bump to version
 1.5.6
In-Reply-To: <20190209182058.5653-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 9 Feb 2019 19:20:58 +0100")
References: <20190209182058.5653-1-peter@korsgaard.com>
Message-ID: <87sgwhtp6d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2018-12551: If Mosquitto is configured to use a password file for
 > authentication, any malformed data in the password file will be treated as
 > valid. This typically means that the malformed data becomes a username and
 > no password.  If this occurs, clients can circumvent authentication and get
 > access to the broker by using the malformed username.  In particular, a
 > blank line will be treated as a valid empty username.  Other security
 > measures are unaffected.  Users who have only used the mosquitto_passwd
 > utility to create and modify their password files are unaffected by this
 > vulnerability.  Affects version 1.0 to 1.5.5 inclusive.

 > CVE-2018-12550: If an ACL file is empty, or has only blank lines or
 > comments, then mosquitto treats the ACL file as not being defined, which
 > means that no topic access is denied.  Although denying access to all topics
 > is not a useful configuration, this behaviour is unexpected and could lead
 > to access being incorrectly granted in some circumstances.  Affects versions
 > 1.0 to 1.5.5 inclusive.

 > CVE-2018-12546: If a client publishes a retained message to a topic that
 > they have access to, and then their access to that topic is revoked, the
 > retained message will still be delivered to future subscribers.  This
 > behaviour may be undesirable in some applications, so a configuration option
 > check_retain_source has been introduced to enforce checking of the retained
 > message source on publish.

 > Add two upstream post-1.5.6 patches to fix a build error in the bridge code
 > when ADNS is enabled and when building with older toolchains not defaulting
 > to C99 mode.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
