From: Stefan Maier <doenermuell@xmail.net>
Date: Mon, 14 May 2007 07:58:35 -0800
Subject: [Buildroot]  Error compiling libgkt2, libglib2
Message-ID: <1179154715.4648791be709d@www.xmail.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the help from Assen Stoyanov (Solution: build glib on Host with Prefix=/usr) I had
success in Compiling Glib, but...

now I have a problem with ATK-Compilation:


 /home/fp/buildroot070514/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-gcc
-DHAVE_CONFIG_H -I. -I. -I.. -I.. -DG_DISABLE_DEPRECATED -pthread
-I/home/fp/buildroot070514/buildroot/build_i686/staging_dir/opt/gnome/include/glib-2.0
-I/home/fp/buildroot070514/buildroot/build_i686/staging_dir/opt/gnome/lib64/glib-2.0/include
-Os -pipe -Wall -MT atkaction.lo -MD -MP -MF .deps/atkaction.Tpo -c atkaction.c 
-fPIC
-DPIC -o .libs/atkaction.o
In file included from atkaction.h:23,
                 from atkaction.c:20:
../atk/atkobject.h:27:25: error: glib-object.h: No such file or directory
In file included from ../atk/atkobject.h:28,
                 from atkaction.h:23,
                 from atkaction.c:20:
../atk/atkstate.h:106: error: expected '=', ',', ';', 'asm' or '__attribute__'
before
'AtkState'
../atk/atkstate.h:108: warning: type defaults to 'int' in declaration of 'gchar'
../atk/atkstate.h:108: error: expected ';', ',' or ')' before '*' token
../atk/atkstate.h:110: error: expected '=', ',', ';', 'asm' or '__attribute__'
before
'gchar'



Installing ATK on the Host with --Prefix=/usr didn't solve it.

Do you have an idea, whats wrong. I tried to manually include the glib-2.0
headers by
copying them to staging_dir/opt/gnome/include/glib-2.0...without success.


Greets

Stefan



Quoting Assen Stoyanov <softa@ttechgroup.com>:

------------------------------------------------------------------------------------
X-Mail.net Communications Center
