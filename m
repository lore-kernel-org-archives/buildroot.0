From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 5 Jun 2018 22:37:39 +0200
Subject: [Buildroot] [BUILDROOT][PATCHv2 1/3] balena: new package
In-Reply-To: <4ce7101b-167a-2c0e-80a3-e678eb660844@savronik.com.tr>
References: <651f579d-07ad-afc4-4515-0061016dfc02@savronik.com.tr>
 <4ce7101b-167a-2c0e-80a3-e678eb660844@savronik.com.tr>
Message-ID: <0cdc4548-ab59-105f-71cb-2314401c88ab@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-06-18 15:26, Refik Tuzakl? wrote:
> +define BALENA_MAKE_DYNBINARY_BALENA
> +??? cd $(@D) && \
> +??? ??? $(BALENA_CONFIGURE_ENV) \
> +??? ??? bash ./hack/make.sh dynbinary-balena

 I think this is where it goes wrong. This hack/make.sh script is also present
in docker-engine, but we don't use it. Instead, docker-engine uses the
hack/make/.go-autogen script.

 Regards,
 Arnout

> +endef

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
