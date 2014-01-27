From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon, 27 Jan 2014 18:57:53 -0500
Subject: [Buildroot] [PATCH] fs/ubi: add option to use custom volume
 config file
In-Reply-To: <CAAEAJfCF=36ET_QAO9fVZdcYRKcFUC96KChKbBO9W=KewL5cXA@mail.gmail.com>
References: <1379215295-1805-1-git-send-email-danomimanchego123@gmail.com>
 <20130915200014.5543b2a1@skate>
 <CANxTyt4GZNTtACwf4W8OCKUBZLf7YfZ=pBM-6KGmgeaf8UCPLg@mail.gmail.com>
 <20130915205310.06f8af50@skate>
 <CANxTyt6uuGy0aYis_SG49KjXjoC=sMWMgTEytTMrhGXifimjYw@mail.gmail.com>
 <20130915211647.6354ea34@skate>
 <CAAEAJfCF=36ET_QAO9fVZdcYRKcFUC96KChKbBO9W=KewL5cXA@mail.gmail.com>
Message-ID: <CANxTyt5j8j-a9tAg4kdt=Q4NEtmPN7EBSM3v6pmnF_t-ygPV3w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ezequiel,

On Mon, Jan 27, 2014 at 6:17 PM, Ezequiel Garc?a
<ezequiel@vanguardiasur.com.ar> wrote:
> Hi Thomas and Danomi,
>
> On 15 September 2013 16:16, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> [...]
>> On Sun, 15 Sep 2013 15:08:28 -0400, Danomi Manchego wrote:
>>
>>> That does appeal to me; I think that we can combine the cp and the sed
>>> lines as well ...
>>>
>>>          $(SED) 's/BR2_ROOTFS_UBIFS_PATH/$@fs/'
>>> $(UBINIZE_CONFIG_FILE_PATH)  >  $(BUILD_DIR)/ubinize.cfg
>>
>> That won't work. $(SED) expands to sed -e -i, i.e it does the sed
>> in-place.
>>
>
> What's the status of this? It would be interesting to pick it up.

A slightly renamed v2 of this patch was submitted in September, found at:

http://patchwork.ozlabs.org/patch/275088/

I applied the patch to the buildroot that we use at work, and have
been using it quite regularly to produce rootfs.ubi images.  No issues
encountered.

Like a child at Christmas, I am have been waiting for the
10-oldest-patches cycle to reach Sept. 2013 to see if this patch
finally will be accepted.

Danomi -
