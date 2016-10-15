From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 15 Oct 2016 21:25:15 +0200
Subject: [Buildroot] [PATCH] configs/lego_ev3: bump kernel to 4.4 series
In-Reply-To: <20161015165155.20004-1-vincent.stehle@laposte.net>
References: <d7af770a-9e6e-abfc-d034-1bb301c716e5@mind.be>
 <20161015165155.20004-1-vincent.stehle@laposte.net>
Message-ID: <845b7e57-435a-c0df-c572-0a14e2caebf7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-10-16 18:51, Vincent Stehle wrote:
> From: Vincent Stehl? <vincent.stehle@laposte.net>
> 
> Bump kernel revision used by lego_ev3_defconfig to the latest tag from
> ev3dev, as suggested by Peter. This is a 4.4 series kernel, which has the
> added benefit of not necessitating a specific gcc to boot.
> 
> We need a patch to create an empty drivers/lego/Kconfig file for the build
> to succeed though, as the ev3dev kernel normally expects a drivers tree to
> be checked out there.
> 
> Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
> Suggested-by: Peter Korsgaard <peter@korsgaard.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
> 
> 
> Hi Peter,                                                                                                                                                                 
>                                                                                                                                                                           
> Thanks for the suggestion. Here is a patch to update lego_ev3_defconfig.                                                                                                  
> This boots fine for me, with gcc 5.4.                                                                                                                                     
>                                                                                                                                                                           
> One remark though: the ev3dev project has a separate drivers tree managed                                                                                                 
> as a git submodule of the kernel (!) I do not really know how to cope with                                                                                                
> that properly, so I just added a patch to repair the build for the moment.                                                                                                
>                                                                                                                                                                           
> Do you know if it is possible for the `linux' recipe to have extra                                                                                                        
> downloads like other packages do? But how would one extract the extra                                                                                                     
> archives to the proper place then?                                                                                                                                        
>   Maybe this calls for an additional `ev3 drivers' package after all, what                                                                                                
> do you think?                                                                                                                                                             
>                                                                                                                                                                           
> Arnout I just saw your e-mail. Thanks for the config file, I double-checked                                                                                               
> the one in this patch. If you don't mind I'd rather stay with a git tree                                                                                                  
> (shallow cloned) rather than a tarball. Is that ok for you?           

 Any reason why you prefer a git tree?

 Regards,
 Arnout


[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
