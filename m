From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Jan 2021 17:36:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/libtorrent-rasterbar: add CPE
 variables
In-Reply-To: <20210124163029.GH2325@scaer>
References: <20210123221956.237522-1-fontaine.fabrice@gmail.com>
 <20210123234522.50b93592@windsurf.home>
 <20210124163029.GH2325@scaer>
Message-ID: <20210124163610.GI2325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2021-01-24 17:30 +0100, Yann E. MORIN spake thusly:
> On 2021-01-23 23:45 +0100, Thomas Petazzoni spake thusly:
> > On Sat, 23 Jan 2021 23:19:56 +0100
> > Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> > > cpe:2.3:a:libtorrent:libtorrent is a valid CPE identifier for this
> > > package:
> > >   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibtorrent%3Alibtorrent
[--SNIP--]
> > We also have package/libtorrent/ in Buildroot. How do we know for sure
> > that the libtorrent:libtorrent CPE ID applies to
> > package/libtorrent-rasterbar/ ? Yes indeed, the latest CPE ID known for
> > libtorrent:libtorrent is 1.2.2, which is pretty close to the 1.2.12 we
> > have in Buildroot for libtorrent-rasterbar. But other than that ?
> libtorrent-rasterbar is the release archive of the libtorrent project;
>     https://github.com/arvidn/libtorrent/releases/tag/v1.2.12

Oh, sorry, I misunderstood you...

libtorrent-rasterbar references two CVEs:

    commit a4b2f636cc6146b85558777cdda59fd55312a0e2
    Author: Arvid Norberg <arvid@cs.umu.se>
    Date:   Mon Jul 29 17:45:26 2019 -0700

        update changelog to include CVE references

    diff --git a/ChangeLog b/ChangeLog
    index d301d9f1c..a9745286f 100644
    --- a/ChangeLog
    +++ b/ChangeLog
    @@ -223,7 +223,7 @@
            * fix IPv6 tracker support by performing the second announce in
            * more cases
            * fix utf-8 encoding check in torrent parser
            * fix infinite loop when parsing maliciously crafted torrents
    -       * fix invalid read in parse_int in bdecoder
    +       * fix invalid read in parse_int in bdecoder (CVE-2017-9847)
            * fix issue with very long tracker- and web seed URLs
            * don't attempt to create empty files on startup, if they
            * already exist
            * fix force-recheck issue (new files would not be picked up)
    @@ -312,7 +312,7 @@

     1.1.1 release

    -       * update puff.c for gzip inflation
    +       * update puff.c for gzip inflation (CVE-2016-7164)
            * add dht_bootstrap_node a setting in settings_pack (and add
            * default)
            * make pad-file and symlink support conform to BEP47
            * fix piece picker bug that could result in division by zero

And those two CVEs are attrobuted to libtorrent in the NIST DB:

    https://nvd.nist.gov/vuln/search/results?form_type=Advanced&results_type=overview&seach_type=all&query=cpe:2.3:a:libtorrent:libtorrent:*:-:*:*:*:*:*:*

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
