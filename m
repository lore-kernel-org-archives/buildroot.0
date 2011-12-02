From: Daniel Mack <zonque@gmail.com>
Date: Fri, 02 Dec 2011 13:04:01 +0100
Subject: [Buildroot] [PATCH] Add package for Gnome NetworkManager
In-Reply-To: <20111202130026.04528496@skate>
References: <1322824479-32767-1-git-send-email-zonque@gmail.com>
 <20111202130026.04528496@skate>
Message-ID: <4ED8BEB1.50500@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/02/2011 01:00 PM, Thomas Petazzoni wrote:
> Le Fri,  2 Dec 2011 12:14:39 +0100,
> Daniel Mack <zonque@gmail.com> a ?crit :
> 
>> +	test -z "`ls -A $(TARGET_DIR)/etc/rc.d`" && rmdir $(TARGET_DIR)/etc/rc.d || echo ""
> 
> Isn't rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/etc/rc.d a bit
> simpler ?

:) See the other thread. I solved it with a rmdir || echo "" for now,
not to rely on the host's mkdir to have that particular feature.

>> +$(eval $(call AUTOTARGETS,package,network-manager))
> 
> Should just be
> 
> $(eval $(call AUTOTARGETS))

Fixed already in the 2nd version I sent.


Thanks,
Daniel
