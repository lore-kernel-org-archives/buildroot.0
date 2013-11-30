From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 30 Nov 2013 09:06:45 +0100
Subject: [Buildroot] [PATCH 1/1] dbus-python: select pyexpat dependency
In-Reply-To: <1384827046-28484-1-git-send-email-vsergeev@kumunetworks.com>
 (Ivan Sergeev's message of "Mon, 18 Nov 2013 18:10:46 -0800")
References: <CAPyrzo3OyL8+macM-9nwjvo=6YpC=3WMggkWAWZFPPnj+VkD=A@mail.gmail.com>
 <1384827046-28484-1-git-send-email-vsergeev@kumunetworks.com>
Message-ID: <87pppiuxd6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ivan" == Ivan Sergeev <vsergeev@kumunetworks.com> writes:

 > dbus-python requires xml.parsers.expat, which is provided by the pyexpat
 > module. This patch enables the pyexpat module as a dependency when dbus-python
 > is selected.

 > Signed-off-by: Ivan Sergeev <vsergeev@kumunetworks.com>
 > ---
 >  package/dbus-python/Config.in | 2 ++
 >  1 file changed, 2 insertions(+)

 > diff --git a/package/dbus-python/Config.in b/package/dbus-python/Config.in
 > index f7b6d94..88a6128 100644
 > --- a/package/dbus-python/Config.in
 > +++ b/package/dbus-python/Config.in
 > @@ -5,6 +5,8 @@ config BR2_PACKAGE_DBUS_PYTHON
 >  	depends on BR2_PACKAGE_DBUS
 >  	depends on BR2_PACKAGE_PYTHON
 >  	select BR2_PACKAGE_DBUS_GLIB
 > +    # pyexpat: runtime dependency only
 > +	select BR2_PACKAGE_PYTHON_PYEXPAT

Committed with the indentation (tabs vs spaces) fixed, thanks.

-- 
Bye, Peter Korsgaard
