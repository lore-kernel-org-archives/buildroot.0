From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Jul 2020 14:54:30 +0200
Subject: [Buildroot] [PATCH] package/dvb-apps: add hash file
In-Reply-To: <20200704010533.1854-1-sergio.prado@e-labworks.com>
References: <20200704010533.1854-1-sergio.prado@e-labworks.com>
Message-ID: <20200705145430.20cc4911@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Yann in Cc.

On Fri,  3 Jul 2020 22:05:33 -0300
Sergio Prado <sergio.prado@e-labworks.com> wrote:

> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---
>  package/dvb-apps/dvb-apps.hash | 6 ++++++
>  1 file changed, 6 insertions(+)
>  create mode 100644 package/dvb-apps/dvb-apps.hash
> 
> diff --git a/package/dvb-apps/dvb-apps.hash b/package/dvb-apps/dvb-apps.hash
> new file mode 100644
> index 000000000000..a618cd7765d3
> --- /dev/null
> +++ b/package/dvb-apps/dvb-apps.hash
> @@ -0,0 +1,6 @@
> +# Locally computed:
> +sha256  099ccbad8dc7263cbeae4c8439f181fb0c031624d8afb40d00bb7462aa1ea645  dvb-apps-3d43b280298c39a67d1d889e01e173f52c12da35.tar.gz

Unfortunately, this doesn't work: it seems like our hashes for
Mercurial fetched packages are not reproducible:

ERROR: dvb-apps-3d43b280298c39a67d1d889e01e173f52c12da35.tar.gz has wrong sha256 hash:
ERROR: expected: 099ccbad8dc7263cbeae4c8439f181fb0c031624d8afb40d00bb7462aa1ea645
ERROR: got     : 926208b7e711b4bab1a909ff9bf4e6ae54acdd30a46f5d5bd700ecb088fe1f57
ERROR: Incomplete download, or man-in-the-middle (MITM) attack
dl-wrapper: Re-downloading 'dvb-apps-3d43b280298c39a67d1d889e01e173f52c12da35.tar.gz'...
real URL is https://linuxtv.org/hg/dvb-apps
requesting all changes
adding changesets
adding manifests
adding file changes
added 1506 changesets with 6093 changes to 2111 files
new changesets d9fe7e17226f:3d43b280298c
ERROR: dvb-apps-3d43b280298c39a67d1d889e01e173f52c12da35.tar.gz has wrong sha256 hash:
ERROR: expected: 099ccbad8dc7263cbeae4c8439f181fb0c031624d8afb40d00bb7462aa1ea645
ERROR: got     : 926208b7e711b4bab1a909ff9bf4e6ae54acdd30a46f5d5bd700ecb088fe1f57
ERROR: Incomplete download, or man-in-the-middle (MITM) attack
--2020-07-05 14:51:38--  http://sources.buildroot.net/dvb-apps/dvb-apps-3d43b280298c39a67d1d889e01e173f52c12da35.tar.gz
Resolving sources.buildroot.net (sources.buildroot.net)... 2606:4700:20::681a:25, 2606:4700:20::681a:125, 2606:4700:20::ac43:4838, ...
Connecting to sources.buildroot.net (sources.buildroot.net)|2606:4700:20::681a:25|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 453406 (443K) [application/x-gtar-compressed]
Saving to: ?/home/thomas/projets/buildroot/output/build/.dvb-apps-3d43b280298c39a67d1d889e01e173f52c12da35.tar.gz.MM0BzY/output?

/home/thomas/projets/bui 100%[================================>] 442,78K  1,82MB/s    in 0,2s    

2020-07-05 14:51:38 (1,82 MB/s) - ?/home/thomas/projets/buildroot/output/build/.dvb-apps-3d43b280298c39a67d1d889e01e173f52c12da35.tar.gz.MM0BzY/output? saved [453406/453406]

dvb-apps-3d43b280298c39a67d1d889e01e173f52c12da35.tar.gz: OK (sha256: 099ccbad8dc7263cbeae4c8439f181fb0c031624d8afb40d00bb7462aa1ea645)

Basically, your hash only matches the tarball on sources.buildroot.net,
but not the tarball I can generate locally after cloning from the
Mercurial repository.

Interestingly, python-pygame is also fetched from Mercurial, also has a
hash file, and it is also wrong:

>>> python-pygame d61ea8eabd56 Downloading
requesting all changes
adding changesets
adding manifests
adding file changes
added 3652 changesets with 15404 changes to 1890 files (+17 heads)                                
new changesets 4609a0076cda:48e19c7b9ee9
ERROR: pygame-d61ea8eabd56.tar.gz has wrong sha256 hash:
ERROR: expected: f95a7dd68ea294d415e36e068d2f533c5a01c67773452d14a535c5c7455681fe
ERROR: got     : d5e0a43a4e338de4cb282af0ddd6e671055d6b9290030c27cfac41b1f7801232
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
