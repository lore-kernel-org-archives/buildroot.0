From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Apr 2011 21:54:47 +0200
Subject: [Buildroot] Buildroot "install" wrapper to preserve file
 permissions
In-Reply-To: <BANLkTi=gd8UtSZLpam0=Luyq8dZzcdfO_g@mail.gmail.com>
References: <BANLkTi=gd8UtSZLpam0=Luyq8dZzcdfO_g@mail.gmail.com>
Message-ID: <20110405215447.135159ef@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 5 Apr 2011 09:48:22 +0200
Daniel Nystr?m <daniel.nystrom@timeterminal.se> wrote:

> An idea born out of the lately device_table.txt and install issues
> discuessed lately.
> 
> In other tools similar to Buildroot (e.g. Axis SDK) I've seen an
> "install" wrapper which sort of populate an device_table.txt while
> installing each component.
> 
> In that way, it will preserve any setup, owner and permission on every
> file without any global device_table.txt modifications.
> 
> (The Axis SDK actually uses meta files in the target dir, but that
> would require a whole lot of tool patching while a dynamically written
> device_table.txt would work as well)
> 
> How would you like this sort of approach in Buildroot?

Yesterday, I've implemented something that allows each package to add
contents to the device table, so that packages can create additional
device files, or adjust the permissions of the files they install. I
needed this to fix the dbus package, which requires a particular
program to have strict permission and ownership properties.

Basically, each package can do:

define <pkg>_PERMISSION_TABLE
some content exactly similar to a device table fragment
endef

and it will automatically be appended to the device table if the
package is enabled.

Would that match your needs ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
