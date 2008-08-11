From: Michel Benoit <murpme@gmail.com>
Date: Mon, 11 Aug 2008 17:42:15 +0200
Subject: [Buildroot] cross compile curl with buildroot
Message-ID: <c88e466f0808110842o35e633c3mb28a3c178ad0a829@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I'm trying to cross compile curl and libcurl for an arm based
at91sam9260 platform with buildroot (latest svn version 23075).

Curl compiles correctly but when I try to run it on the target I get
an "Illegal instruction" error after the first chunk of data is
received from an http url.


#
# curl www.dn.se

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="sv-SE" lang="sv-SE">
<head>
        <meta http-equiv="Content-Type" content="text/html;
charset=ISO-8859-1" />
        <link rel="shortcut icon"
href="http://www.dn.se/DNet/images/favicon.ico" />
        <link rel="alternate" href="http://www.dn.se/huvudnyheter-rss"
type="application/rss+xml" title="DN - Viktigaste nyh>
        <link rel="alternate" href="http://www.dn.se/nyheter-rss"
type="application/rss+xml" title="DN - Nyheter" />
        <link rel="alternate" href="http://www.dn.se/ekonomi-rss"
type="application/rss+xml" title="DN - Ekonomi" />
        <link rel="alternate" href="http://www.dn.se/sport-rss"
type="application/rss+xml" title="DN - Sport" />
        <link rel="alternate" href="http://www.dn.se/fotboll-rss"
type="application/rss+xml" title="DN - Fotboll" />
        <link rel="alternate" href="http://www.dn.se/stockholm-rss"
type="application/rss+xml" title="DN - Stockholm" />
        <link rel="alternate" href="http://www.dn.se/politik-rss"
type="application/rss+xml" title="
Illegal instruction
#



I have an older version of libcurl (that I built manually using an
older version of buildroot's arm-linux compiler tools)  which works
fine if I copy it over manually to my target.  That would seem to
indicate that there is nothing missing on the target and that somehow
libcurl is being corrupted during the config, build, link or install
steps of buildroot.

I am using GCC 4.2.4 and binutils 2.18.

Does anyone have an idea what could be causing libcurl to throw an
Illegal instruction signal?
Has anyone successfully cross-compiled curl for an arm target?

Michel
