From: Daniel Mack <zonque@gmail.com>
Date: Mon, 05 Dec 2011 16:02:32 +0100
Subject: [Buildroot] [PATCH v2] Add package connman
In-Reply-To: <20111205150111.GC30001@sapphire.tkos.co.il>
References: <20111205130056.GB30001@sapphire.tkos.co.il>
 <1323090955-5661-1-git-send-email-zonque@gmail.com>
 <87obvnrsnv.fsf@macbook.be.48ers.dk>
 <20111205150111.GC30001@sapphire.tkos.co.il>
Message-ID: <4EDCDD08.3060600@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/05/2011 04:01 PM, Baruch Siach wrote:
> Hi Peter,
> 
> On Mon, Dec 05, 2011 at 03:37:24PM +0100, Peter Korsgaard wrote:
>>>>>>> "Daniel" == Daniel Mack <zonque@gmail.com> writes:
>>  Daniel> +	$(if 
>>  $(BR2_PACKAGE_CONNMAN_THREADS),--enable-threads,--disable-threads)		\
>>  Daniel> +	$(if $(BR2_PACKAGE_CONNMAN_DEBUG),--enable-debug,--disable-debug)		\
>>  Daniel> +	$(if $(BR2_PACKAGE_CONNMAN_ETHERNET),--enable-ethernet,--disable-ethernet)	\
>>  Daniel> +	$(if $(BR2_PACKAGE_CONNMAN_WIFI),--enable-wifi,--disable-wifi)			\
>>
>> You probably also need to add wpa_supplicant to CONNMAN_DEPENDENCIES
> 
> AFAIK, wpa_supplicant is a run-time dependency, not a build-time one. So, the 
> Config.in 'select' should be enough.

That's what I was thinking too, yes. I'll look into the other comments.


Daniel
