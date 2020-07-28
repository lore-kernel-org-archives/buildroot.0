From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Wed, 29 Jul 2020 00:07:14 +0200
Subject: [Buildroot] [PATCH v3 0/8] Improving CVE reporting
In-Reply-To: <20200728095227.7c9af284@windsurf.home>
References: <20200724154356.2607639-1-gregory.clement@bootlin.com>
 <20200728095227.7c9af284@windsurf.home>
Message-ID: <a0a9b50d-46d0-cb29-aca7-ccf611abde57@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

On 28/07/20 09:52, Thomas Petazzoni wrote:
> 
> Could you give some specific example of where those AND operators with
> child nodes are used ? This would help understand what are the
> situations that make use of this.
> 
> Thanks!
> 
> Thomas
> 

See for example CVE-2019-3699 
(https://nvd.nist.gov/vuln/detail/CVE-2019-3699). This is about a 
vulnerability of privoxy when it runs on OpenSuse. This CVE is currently 
detected for the privoxy package on http://autobuild.buildroot.net/stats/

I have extracted the NVD entry from the NVD 2019 json file for 
convenience: http://paste.awesom.eu/ibNy . The matching CPEs are 
logically declared as follows:

AND(
     privoxy:privoxy <3.0.28-lp151.1.1,
     opensuse:leap:15.1
)


They seem to use this to indicate if a particular distribution/OS is 
vulnerable to the CVE.

Titouan
