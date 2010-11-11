From: Don Smyth <dsmyth@signett.com>
Date: Wed, 10 Nov 2010 22:31:23 -0800
Subject: [Buildroot] java support in buildroot
In-Reply-To: <20101108201608.00131d2d@surf>
References: <AANLkTins6w3F0edPkF4Tp_J8jCOoJgH+ePqm=oabZNWG@mail.gmail.com>
	<8739rodcwm.fsf@macbook.be.48ers.dk>
	<AANLkTi=-fVydqw4HBDc8WsJL8kpj956tbkuf0yps0o2p@mail.gmail.com>
	<20101108201608.00131d2d@surf>
Message-ID: <AANLkTin30h8P74_zZ4yq5Myxr65jC4yxeQKdDp1sn=rS@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To test, I built jamvm, classpath and concierge.

To test all three together, cp /usr/lib/concierge/init.xargs to /root, then
start concierge from /root. You should see something like this, dumping you
into the concierge shell:

# concierge
---------------------------------------------------------
  Concierge OSGi 1.0.0 on Linux 2.6.36 starting ...
---------------------------------------------------------
SETTING ALL DEBUG FLAGS
Logger initialized, loglevel is DEBUG
purging storage ...
INSTALLING file:///usr/lib/concierge/shell-1.0.0.jar
[Thu Nov 11 06:27:43 GMT 2010] [INFO] BundleClassLoader: Resolving Bundle
[1]: file:///usr/lib/concierge/shell-1.0.0.jar (not critical)
[Thu Nov 11 06:27:46 GMT 2010] [DEBUG] Bundle Bundle [1]:
file:///usr/lib/concierge/shell-1.0.0.jar requests package
ch.ethz.iks.concierge.shell.commands
[Thu Nov 11 06:27:46 GMT 2010] [DEBUG] Bundle Bundle [1]:
file:///usr/lib/concierge/shell-1.0.0.jar registers resolved packages
[ch.ethz.iks.concierge.shell.commands]
[Thu Nov 11 06:27:47 GMT 2010] [DEBUG] REGISTERED PACKAGE
ch.ethz.iks.concierge.shell.commands
INSTALLING file:///usr/lib/concierge/service-tracker-1.0.0.jar
[Thu Nov 11 06:27:48 GMT 2010] [INFO] BundleClassLoader: Resolving Bundle
[2]: file:///usr/lib/concierge/service-tracker-1.0.0.jar (not critical)
[Thu Nov 11 06:27:49 GMT 2010] [DEBUG] Bundle Bundle [2]:
file:///usr/lib/concierge/service-tracker-1.0.0.jar requests package
org.osgi.util.tracker
[Thu Nov 11 06:27:50 GMT 2010] [DEBUG] Bundle Bundle [2]:
file:///usr/lib/concierge/service-tracker-1.0.0.jar registers resolved
packages [org.osgi.util.tracker;specification-version=1.2]
[Thu Nov 11 06:27:51 GMT 2010] [DEBUG] REGISTERED PACKAGE
org.osgi.util.tracker; specification-version=1.2.0
INSTALLING file:///usr/lib/concierge/event-admin-1.0.0.jar
[Thu Nov 11 06:27:52 GMT 2010] [INFO] BundleClassLoader: Resolving Bundle
[3]: file:///usr/lib/concierge/event-admin-1.0.0.jar (not critical)
[Thu Nov 11 06:27:53 GMT 2010] [DEBUG] Bundle Bundle [3]:
file:///usr/lib/concierge/event-admin-1.0.0.jar requests package
org.osgi.service.event
[Thu Nov 11 06:27:53 GMT 2010] [DEBUG] Bundle Bundle [3]:
file:///usr/lib/concierge/event-admin-1.0.0.jar registers resolved packages
[org.osgi.service.event]
[Thu Nov 11 06:27:54 GMT 2010] [DEBUG] REGISTERED PACKAGE
org.osgi.service.event
STARTING file:///usr/lib/concierge/shell-1.0.0.jar
[Thu Nov 11 06:27:55 GMT 2010] [INFO] Framework: REQUESTED SERVICE
org.osgi.service.packageadmin.PackageAdmin
[Thu Nov 11 06:27:56 GMT 2010] [INFO] RETURNED
ServiceReference{SystemBundle}
[Thu Nov 11 06:27:57 GMT 2010] [INFO] Framework: REQUESTED SERVICE
org.osgi.service.startlevel.StartLevel
[Thu Nov 11 06:27:58 GMT 2010] [INFO] RETURNED
ServiceReference{SystemBundle}

Concierge> [Thu Nov 11 06:27:59 GMT 2010] [INFO] Framework: Bundle Bundle
[1]: file:///usr/lib/concierge/shell-1.0.0.jar started.
STARTING file:///usr/lib/concierge/service-tracker-1.0.0.jar
STARTING file:///usr/lib/concierge/event-admin-1.0.0.jar
[Thu Nov 11 06:28:00 GMT 2010] [INFO] Framework: REGISTERED SERVICE
org.osgi.service.event.EventAdmin
[Thu Nov 11 06:28:00 GMT 2010] [INFO] Framework: Bundle Bundle [3]:
file:///usr/lib/concierge/event-admin-1.0.0.jar started.
---------------------------------------------------------
  Framework started in 18.981 seconds.
---------------------------------------------------------


Concierge> help
Concierge Shell:
bundles
 services [<bundle>]
install <URL of bundle>
start <bundleId>
 stop <bundleId>
update <bundleId> [<URL>]
uninstall <bundleId>
 headers <bundleId>
properties <serviceId>
printenv
 restart (framework)
exit (framework)
quit (shell)

startlevel.{
startLevel [<bundleId>]
bundleStartLevel [<bundleId>] level
 initStartLevel [<bundleId>]
persistentlyStarted [<bundleId>]
 }
package.{
packages [<bundleID>]
 refresh [bundleID]
}

Concierge> printenv
path.separator = :
java.vm.name = JamVM
osgi.auto.install.1 =
java.vm.specification.name = Java Virtual Machine Specification
org.osgi.framework.executionenvironment =
J2SE-1.5,J2SE-1.4,OSGi/Minimum-1.1,J2SE-1.3,J2SE-1.2,OSGi/Minimum-1.0,JRE-1.1
org.osgi.framework.vendor = Concierge
java.runtime.version = 1.5.4
java.home = /usr
java.vm.specification.version = 1.0
ch.ethz.iks.concierge.debug = true
line.separator =

ch.ethz.iks.concierge.log.level = 4
java.vm.specification.vendor = Sun Microsystems, Inc.
gnu.classpath.home.url = file:///usr/lib
gnu.classpath.version = 0.98
java.specification.version = 1.5
org.osgi.framework.processor = arm
org.osgi.framework.os.version = 2.6.36
java.library.path =
gnu.classpath.vm.shortname = JamVM
org.osgi.framework.version = 1.2
java.class.version = 48.0
java.specification.name = Java Platform API Specification
gnu.classpath.mime.types.file = /etc/mime.types
os.version = 2.6.36
org.osgi.framework.language = en
gnu.classpath.home = /usr
user.home = /root
file.encoding = 8859_1
osgi.auto.start.1 =  file:///usr/lib/concierge/shell-1.0.0.jar
file:///usr/lib/concierge/service-tracker-1.0.0.jar
file:///usr/lib/concierge/event-admin-1.0.0.jar
os.name = Linux
user.name = root
java.class.path = /usr/lib/concierge/concierge-1.0.0.jar
java.io.tmpdir = /tmp
gnu.classpath.boot.library.path = /usr/lib/classpath
os.arch = arm
java.specification.vendor = Sun Microsystems, Inc.
user.dir = /root
java.version = 1.5.0
java.vm.vendor.url = http://jamvm.org
java.ext.dirs =
java.boot.class.path =
/usr/share/jamvm/classes.zip:/usr/share/classpath/glibj.zip
sun.boot.class.path =
/usr/share/jamvm/classes.zip:/usr/share/classpath/glibj.zip
java.vm.vendor = Robert Lougher
java.vendor.url = http://www.classpath.org
java.vendor = GNU Classpath
file.separator = /
java.compiler =
java.vm.version = 1.5.4
org.osgi.framework.os.name = Linux
osgi.init = true
http.agent = gnu-classpath/0.98 (JamVM/1.5.4)
gnu.cpu.endian = little
ch.ethz.iks.concierge.log.enabled = true

Concierge>

--
Don Smyth
dsmyth at signett.com
+1-206-245-7625


On Mon, Nov 8, 2010 at 11:16 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> On Sun, 7 Nov 2010 21:50:09 -0800
> Don Smyth <dsmyth@signett.com> wrote:
>
> > Patches to update java support:
> >
> > 1) enable java in main Config.in (works with external glibc based
> > toolchain) 2) update jamvm to 1.5.4
> > 3) update concierge to 1.0.0, fix sample bundle download, fix sample
> > bundle paths in init.xargs
>
> Thanks!
>
> Could you just give an example on how to easily test that jamvm and
> concierge are working ?
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101110/c7b20bd8/attachment.html>
