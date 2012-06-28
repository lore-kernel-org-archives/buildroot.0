From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 29 Jun 2012 00:12:11 +0200
Subject: [Buildroot] [PATCH RFC 1/2] Add configuration item for custom
 JavaScript install path
In-Reply-To: <CAHt8ZCPKVG8VNUhYbzTV+u6VZgFnHCw5+8_--_+xE0XV7gnutw@mail.gmail.com>
References: <1340088964-10630-1-git-send-email-spdawson@gmail.com>
 <1340088964-10630-2-git-send-email-spdawson@gmail.com>
 <4FE25F07.6020103@mind.be>
 <CAHt8ZCPKVG8VNUhYbzTV+u6VZgFnHCw5+8_--_+xE0XV7gnutw@mail.gmail.com>
Message-ID: <4FECD6BB.3050901@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/26/12 10:32, Simon Dawson wrote:
> Thanks for the feedback Arnout.
>
> On 21 June 2012 00:38, Arnout Vandecappelle<arnout@mind.be>  wrote:
>>   I would instead define a WWW_INSTALL_PATH, which can also be used to set
>> the wwwroot of the various http servers.
>
> It's a good idea, but I don't know quite how it would be achieved
> cleanly. A quick grep through Buildroot reveals the following
> potential problem files.
>
> * package/boa/boa.conf
> * package/tinyhttpd/S85tinyhttpd
> * package/tinyhttpd/tinyhttpd.patch
>
> The configuration files could be fixed up during installation of the
> relevant packages, but the httpd patch is more of a problem.
>
> Does anyone have a suggestion for how to deal with this?


  Add -DWWW_INSTALL_PATH='"$(WWW_INSTALL_PATH)"' to CFLAGS.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
