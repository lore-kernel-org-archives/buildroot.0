From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 6 Jul 2011 19:00:37 +0200
Subject: [Buildroot] Why chmod ug+rw?
Message-ID: <201107061900.37544.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hoi all,

 Why does buildroot make the sources group-writable?

 A bit of context: I'm using Thomas Petazzoni's patch to have a custom package 
extract function that rsyncs the source code into the build directory.  I 
noticed that rsync always goes through the whole tree, because it needs to 
update permissions.  This is because of the below:

	$($(PKG)_EXTRACT_CMDS)
# some packages have messed up permissions inside
	$(Q)chmod -R ug+rw $(@D)

 Now I agree that some packages have messed up permissions, but why does the 
group need read and write permission?  Especially since in buildroot 
everything is owned by the user and no su-ing is done.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
