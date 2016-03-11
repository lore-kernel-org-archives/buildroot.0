From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 11 Mar 2016 01:10:14 +0100
Subject: [Buildroot] [PATCH] busybox: use md5 as default password
 algorithm
In-Reply-To: <87pov2j8mt.fsf@dell.be.48ers.dk>
References: <1457638990-27544-1-git-send-email-gustavo@zacarias.com.ar>
 <871t7im7ah.fsf@dell.be.48ers.dk> <56E1D309.3030602@zacarias.com.ar>
 <87pov2j8mt.fsf@dell.be.48ers.dk>
Message-ID: <56E20CE6.9090500@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/10/16 23:00, Peter Korsgaard wrote:
>>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:
>
>   > On 10/03/16 17:01, Peter Korsgaard wrote:
>   >> So this is what is used when you change password through the busybox
>   >> passwd applet or create a new user, right?
>   >>
>   >> Shouldn't we instead tweak this based on BR2_TARGET_GENERIC_PASSWD_*?
>
>   > Yes.
>   > This is the lowest-common which is guaranteed to work on all
>   > scenarios, once we decide/switch to sha256 as default we can update it
>   > here, but i wouldn't defer this until then.
>
> Ehh, yes - But if you have enabled E.G BR2_TARGET_GENERIC_PASSWD_SHA512
> then that is what the busybox passwd applet should use. Having it do md5
> instead of des is still wrong.

  Peter, you yourself said that we should limit the amount of KCONFIG_* fixups 
we do. And there is no other way to make it depend on the 
BR2_TARGET_GENERIC_PASSWD_* choice.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
