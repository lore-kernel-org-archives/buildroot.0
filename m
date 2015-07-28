From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 22:43:22 +0200
Subject: [Buildroot] [PATCH 001/113] dbus-python: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150728224322.723d5c8c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 28 Jul 2015 15:39:02 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/dbus-python/dbus-python.hash | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 package/dbus-python/dbus-python.hash

I've applied the entire series, thanks. I found two "issues":

 * The title "maccchanger: add hash file" was wrong, it should have
   been "macchanger: add hash file", i.e only two C and not three.

 * I had a previous flot-0.8.3.tar.gz tarball in my download folder,
   and its hash didn't match the one you used. So it re-downloaded a
   new tarball, and the new one matched your hash. So this seems to
   indicate that upstream is changing the tarball without renaming it,
   which might lead to troubles in the future:

ERROR: flot-0.8.3.tar.gz has wrong sha256 hash:
ERROR: expected: d6bddb781ce8ab8bba82c535a0767c22e606cabd9dbb484027b8ff375a193952
ERROR: got     : ef9a873befe3ff5ea42ebf1c3657887265a1717744ca8ed0c2bd3dd736d16b21
ERROR: Incomplete download, or man-in-the-middle (MITM) attack
dl-wrapper: Re-downloading 'flot-0.8.3.tar.gz'...
--2015-07-28 22:38:07--  http://www.flotcharts.org/downloads/flot-0.8.3.tar.gz
R?solution de www.flotcharts.org (www.flotcharts.org)? 185.31.18.133
Connexion ? www.flotcharts.org (www.flotcharts.org)|185.31.18.133|:80? connect?.
requ?te HTTP transmise, en attente de la r?ponse? 200 OK
Taille?: 596913 (583K) [application/octet-stream]
Enregistre : ?/home/thomas/projets/buildroot/output/build/.flot-0.8.3.tar.gz.tNaf6x/output?

/home/thomas/projets/buildroot/output/build/.f 100%[====================================================================================================>] 582,92K  1,54MB/s   ds 0,4s   

2015-07-28 22:38:08 (1,54 MB/s) - ?/home/thomas/projets/buildroot/output/build/.flot-0.8.3.tar.gz.tNaf6x/output? enregistr? [596913/596913]

ERROR: flot-0.8.3.tar.gz has wrong sha256 hash:
ERROR: expected: d6bddb781ce8ab8bba82c535a0767c22e606cabd9dbb484027b8ff375a193952
ERROR: got     : ef9a873befe3ff5ea42ebf1c3657887265a1717744ca8ed0c2bd3dd736d16b21
ERROR: Incomplete download, or man-in-the-middle (MITM) attack
--2015-07-28 22:38:08--  http://sources.buildroot.net/flot-0.8.3.tar.gz
R?solution de sources.buildroot.net (sources.buildroot.net)? 176.9.16.109
Connexion ? sources.buildroot.net (sources.buildroot.net)|176.9.16.109|:80? connect?.
requ?te HTTP transmise, en attente de la r?ponse? 200 OK
Taille?: 591931 (578K) [application/x-gzip]
Enregistre : ?/home/thomas/projets/buildroot/output/build/.flot-0.8.3.tar.gz.burCoL/output?

/home/thomas/projets/buildroot/output/build/.f 100%[====================================================================================================>] 578,06K  2,15MB/s   ds 0,3s   

2015-07-28 22:38:14 (2,15 MB/s) - ?/home/thomas/projets/buildroot/output/build/.flot-0.8.3.tar.gz.burCoL/output? enregistr? [591931/591931]

flot-0.8.3.tar.gz: OK (sha256: d6bddb781ce8ab8bba82c535a0767c22e606cabd9dbb484027b8ff375a193952)

    Hum, now that I look at it, your hash is in fact only correct for
    the sources.buildroot.net copy of the tarball, not for the upstream
    one.

Can you check that?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
