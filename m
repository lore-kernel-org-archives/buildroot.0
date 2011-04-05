From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 05 Apr 2011 21:58:46 +0200
Subject: [Buildroot] Buildroot "install" wrapper to preserve file
	permissions
In-Reply-To: <20110405215447.135159ef@surf> (Thomas Petazzoni's message of
	"Tue, 5 Apr 2011 21:54:47 +0200")
References: <BANLkTi=gd8UtSZLpam0=Luyq8dZzcdfO_g@mail.gmail.com>
	<20110405215447.135159ef@surf>
Message-ID: <87ipuswjux.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> How would you like this sort of approach in Buildroot?

 Thomas> Yesterday, I've implemented something that allows each package to add
 Thomas> contents to the device table, so that packages can create additional
 Thomas> device files, or adjust the permissions of the files they install. I
 Thomas> needed this to fix the dbus package, which requires a particular
 Thomas> program to have strict permission and ownership properties.

 Thomas> Basically, each package can do:

 Thomas> define <pkg>_PERMISSION_TABLE
 Thomas> some content exactly similar to a device table fragment
 Thomas> endef

 Thomas> and it will automatically be appended to the device table if the
 Thomas> package is enabled.

 Thomas> Would that match your needs ?

I think Daniel's proposal is to use a custom install program (wrapper),
which would then automatically create those device_table.txt snippets.

I like the idea.

-- 
Bye, Peter Korsgaard
