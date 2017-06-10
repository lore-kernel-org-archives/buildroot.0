From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 10 Jun 2017 13:07:41 +0200
Subject: [Buildroot] [PATCH 3/3] package/rpi-firmware: updated to 4.9.31
	firmware (ca9116f)
In-Reply-To: <d06f4897-e954-5473-5137-236cfa5f80d3@mind.be>
References: <20170610070050.20782-1-mail@jens-maus.de>
 <8E8EFCD7-3A29-410A-A992-9D62BE9C604F@free.fr>
 <7729E3FB-13CA-4123-B840-4EAF2AB64673@jens-maus.de>
 <8F29C33F-DF80-4401-B36B-23E12D859201@free.fr>
 <d06f4897-e954-5473-5137-236cfa5f80d3@mind.be>
Message-ID: <56E8F50E-0A95-4D44-8BFE-8F7BF5BB817B@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Jens, All,

On June 10, 2017 12:40:47 PM GMT+02:00, Arnout Vandecappelle <arnout@mind.be> wrote:
>On 10-06-17 11:45, Yann E. MORIN wrote:
[snip]
>> Also, I would prefer you just add them to the existing list.
>> It is better to be explicit rather than having a catch-all
>> command.
>
>But then, a loop that iterates over a list of variables is still nicer
>than
>repeating the command 7 times.

Yup.

RPI_FIRMWARE_DTBS = \
    rpi-b.dtb \
    rpi-b-plus.dtb etc....

define RPI_FIRMWARE_INSTALL_DTBS
    $(foreach dtb,$(RPI_FIRMWARE_DTBS),\
        $(INSTALL) -D -m 0644 $(@D)/dtbs/$(dtb) $(BINARIES_DIR)/rpi-firmware/$(dtb))
endef

(of course, fix my typoes, the dtb filenames, and the variable names)

Regards,
Yann E. MORIN.

-- 
Sent from my phone. Please excuse my brevity.
