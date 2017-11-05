From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 5 Nov 2017 13:46:33 +0100
Subject: [Buildroot] [PATCH v4 1/1] package/libssh2: Add selectable
 crypto libraries
In-Reply-To: <87lgjl2el7.fsf@dell.be.48ers.dk>
References: <1509553376-43168-1-git-send-email-sam.voss@rockwellcollins.com>
 <9271f8cc-651b-e302-f82c-9e44a0af24d4@mind.be>
 <87tvy92lyy.fsf@dell.be.48ers.dk> <20171105081900.GC2996@scaer>
 <87lgjl2el7.fsf@dell.be.48ers.dk>
Message-ID: <6626fb96-a677-2bbe-d801-7352cc4c6428@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-11-17 11:40, Peter Korsgaard wrote:
>>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
> Hi,
> 
>  >> >  This does affect people updating Buildroot, so it needs to be mentioned in CHANGES.
>  >> 
>  >> Why don't we just keep the old logic instead? E.G. leave the select
>  >> openssl if !(mbedtls || libgcrypt) and then change the selects to
>  >> depends on in the choice:
>  >> 
>  >> choice
>  >> 
>  >> config BR2_PACKAGE_LIBSSH2_MBEDTLS
>  >> bool "mbedtls"
>  >> depends on BR2_PACKAGE_MBEDTLS
>  >> 
>  >> ...
>  >> 
>  >> Doesn't that give us the best of both worlds? Same behaviour as before
>  >> by default and still the option to explicitly chose when multiple
>  >> backends are available?
> 
>  > That's what Sam did in the initial iterations of his patchset, but
>  > Arnout and Thomas (IIRC) both requested he replaces that with a select
>  > instead.
> 
> Hmm, I could only find Arnouts mail asking to use select, but he didn't
> write why. Arnout, why not use depends on here?

 I was just applying the default principle that you should use select rather
than depends unless there is a good reason to use depends. I hadn't thought of
backward compatibility back then, and I didn't think of using depends now.

 I've already committed, can you fix it up?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
