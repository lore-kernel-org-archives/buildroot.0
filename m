From: Tony Mozi <spooflinux@hotmail.fr>
Date: Tue, 9 Feb 2010 17:56:57 +0100
Subject: [Buildroot] 'make' in buildroot with proxy and ftp not available
Message-ID: <SNT129-W82FE6851F0AD37F987C26B9500@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net







Hi all,
I'm using Buildroot-2009.11 in order to make the cross compilation of the Linux-2.6.22.2 for an ARM9.
Now, my company uses a proxy .
In buildroot, I make 'make menuconfig' and I configure things like I need.
Then I make "make".

There are some problems.

root at user-laptop:/home/user/Documents/buildroot-2009.11# make

Checking build system dependencies:
BUILDROOT_DL_DIR clean:                Ok
CC clean:                    Ok
CXX clean:                    Ok
CPP clean:                    Ok
CFLAGS clean:                    Ok
INCLUDES clean:                    Ok
CXXFLAGS clean:                    Ok
which installed:                Ok
sed works:                    Ok (/bin/sed)
GNU make version '3.81':            Ok
C compiler '/usr/bin/gcc'
C compiler version '4.4.1':            Ok
C++ compiler '/usr/bin/g++'
C++ compiler version '4.4.1':            Ok
awk installed:                    Ok
bash installed:                    Ok
bison installed:                Ok
flex installed:                    Ok
gettext installed:                Ok
makeinfo installed:                Ok
patch installed:                Ok
Build system dependencies:            Ok

rm -rf /home/user/Documents/buildroot-2009.11/output/build/buildroot-config
mkdir -p /home/user/Documents/buildroot-2009.11/output/build
cp -dpRf package/config/buildroot-config /home/user/Documents/buildroot-2009.11/output/build/buildroot-config
--2010-02-09 17:44:17--  http://www.kernel.org/pub//linux/kernel/v2.6//linux-2.6.31.6.tar.bz2
R?solution de www.kernel.org... 130.239.17.4, 199.6.1.164
Connexion vers www.kernel.org|130.239.17.4|:80... ?chec: Connexion termin?e par expiration du d?lai d'attente.
Connexion vers www.kernel.org|199.6.1.164|:80... 

Well, I add the proxy 'export http_proxy="http://<username>:<password>@<proxy URL>:<port>/
I have no username and no password.
So I do 'export http_proxy="http://:@titi.toto.fr:1234/

I redo a "make", and I have the same problems.
I think there is a mistake in my command, but I don't know where.
With the new network, ftp is not available... 

How can I do?

BR
 		 	   		  
_________________________________________________________________
Nouveau?! Tout Windows Live d?barque dans votre t?l?phone. Voir les Windows phone
http://clk.atdmt.com/FRM/go/175819071/direct/01/
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100209/7ba2935a/attachment.htm>
