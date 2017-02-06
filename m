From: Chris Frederick <cdf123@cdf123.net>
Date: Mon, 6 Feb 2017 16:19:16 -0600
Subject: [Buildroot] [PATCH 1/1] sudo: Add ldap support for sudoers rules
In-Reply-To: <87mvdzugva.fsf@dell.be.48ers.dk>
References: <1477323263-6689-1-git-send-email-cdf123@cdf123.net>
 <20170206195401.11ccbee3@free-electrons.com>
 <87r33buhqk.fsf@dell.be.48ers.dk>
 <20170206223806.5632b9ad@free-electrons.com>
 <87mvdzugva.fsf@dell.be.48ers.dk>
Message-ID: <beeb4152-d3a2-b39d-f34c-9a19e94bba60@cdf123.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/06/2017 03:52 PM, Peter Korsgaard wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
>  > Hello,
>  > On Mon, 06 Feb 2017 22:33:39 +0100, Peter Korsgaard wrote:
> 
>  >> > I've applied, after removing the explicit Config.in option and instead
>  >> > relying on whether BR2_PACKAGE_OPENLDAP is enabled or not to decide if
>  >> > ldap support should be enabled or not in sudo.  
>  >> 
>  >> Notice that this was discussed during the first review:
>  >> 
>  >> http://lists.busybox.net/pipermail/buildroot/2016-October/175480.html
>  >> 
>  >> Apparently sudo with pam support really needs a configured
>  >> /etc/ldap.conf, which might be confusing to people that (perhaps
>  >> unrelated to eachother) enabled both sudo and ldap.
> 
>  > So in other words we really want to have a sub-option for this
>  > situation?
> 
> I don't personally know anything about it, but that was the conclusion
> of Arnout and Chris, yes.
> 

It looks like you can configure sudoers access via /etc/nsswitch.conf:

See "Configuring nsswitch.conf" in the sudoers ldap manual:
https://www.sudo.ws/man/1.8.17/sudoers.ldap.man.html

So it could be left to the end user building the image to add their own nsswitch.conf entry to control it.  It also mentions that sudo defaults
to using /etc/sudoers exclusively, so it should be compatible with users not using ldap sudoers with no changes required of them.

Chris Frederick
