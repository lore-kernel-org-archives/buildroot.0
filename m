From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Sep 2017 01:08:52 +0200
Subject: [Buildroot] [PATCH 1/1] netsnmp: install all MIB files
In-Reply-To: <20170908134548.23645-1-julien.floret@6wind.com>
References: <20170908134548.23645-1-julien.floret@6wind.com>
Message-ID: <8d8bb3d5-6ea9-94b4-1a53-a57909b8bbc6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-09-17 15:45, Julien Floret wrote:
> Since commit be8e32d585f3 ("netsnmp: configurable MIB modules"),
> the list of MIB modules can be selected with a configuration option.
> 
> However, there was still an hardcoded list of MIB files to exclude from
> the target filesystem.
> Since it is complicated to know which MIB files are necessary according
> to the configuration, let's install all of them.
> 
> Cc: przemyslaw <przemyslaw.wrzos@calyptech.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Signed-off-by: Julien Floret <julien.floret@6wind.com>

 Looks good to me, except: shouldn't the default of
BR2_PACKAGE_NETSNMP_WITHOUT_MIB_MODULES so that all the previous BLOAT_MIBS are
there?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
