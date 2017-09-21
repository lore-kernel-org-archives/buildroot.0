From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 21 Sep 2017 23:09:57 +0200
Subject: [Buildroot] [PATCH] package/dfu-util: allow to build it for the
 target as well
In-Reply-To: <cb5803af-b598-5a40-b0ae-25b560f91dc7@grandegger.com>
References: <cb5803af-b598-5a40-b0ae-25b560f91dc7@grandegger.com>
Message-ID: <f95704df-2a65-18d5-d241-a3cc2e3d1173@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-09-17 17:31, Wolfgang Grandegger wrote:
> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>

 Have you tested this at all?

Makefile:537: *** libusb is in the dependency chain of dfu-util that has added
it to its _DEPENDENCIES variable without selecting it or depending on it from
Config.in.  Stop.

 And therefore you also need to propagate the threads dependency and add a comment.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
