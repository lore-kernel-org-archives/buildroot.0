From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 18 Mar 2010 08:49:36 +0000 (UTC)
Subject: [Buildroot] [Bug 1351] New: host-libxslt-1.1.24 fails to build
Message-ID: <bug-1351-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1351

              Host: X86_64
            Target: ARM
             Build: buildroot-git
           Summary: host-libxslt-1.1.24 fails to build
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: paul.jones at iwtech.com.au
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=1327)
 --> (https://bugs.busybox.net/attachment.cgi?id=1327)
Buildroot config

make[3]: Leaving directory
`/media/stuff/kisssroot/output/build/host-libxslt-1.1.24/libexslt'              
Making all in xsltproc                                                          
make[3]: Entering directory
`/media/stuff/kisssroot/output/build/host-libxslt-1.1.24/xsltproc'              
/usr/bin/gcc -I/media/stuff/kisssroot/output/host/include
-I/media/stuff/kisssroot/output/host/usr/include -DHAVE_CONFIG_H -I. -I.. -I..
-I../libxslt -I../libexslt -I.. -I../libxslt -I../libexslt
-I/media/stuff/kisssroot/output/host/usr/include/libxml2
-I/media/stuff/kisssroot/output/host/include
-I/media/stuff/kisssroot/output/host/usr/include -Wall   
-I/media/stuff/kisssroot/output/host/include
-I/media/stuff/kisssroot/output/host/usr/include -Wall -MT xsltproc.o -MD -MP
-MF .deps/xsltproc.Tpo -c -o xsltproc.o xsltproc.c                              
mv -f .deps/xsltproc.Tpo .deps/xsltproc.Po                                      
/bin/sh ../libtool --tag=CC   --mode=link /usr/bin/gcc
-I/media/stuff/kisssroot/output/host/include
-I/media/stuff/kisssroot/output/host/usr/include 
-I/media/stuff/kisssroot/output/host/include
-I/media/stuff/kisssroot/output/host/usr/include -Wall 
-L/media/stuff/kisssroot/output/host/lib
-L/media/stuff/kisssroot/output/host/usr/lib -o xsltproc xsltproc.o
-L/usr/lib64 -lgcrypt -lgpg-error ../libxslt/libxslt.la ../libexslt/libexslt.la
-L/media/stuff/kisssroot/output/host/usr/lib -lxml2 -lz -lm
-L/media/stuff/kisssroot/output/host/usr/lib -lxml2 -lz -lm -lm                 
mkdir .libs                                                                     
/usr/bin/gcc -I/media/stuff/kisssroot/output/host/include
-I/media/stuff/kisssroot/output/host/usr/include
-I/media/stuff/kisssroot/output/host/include
-I/media/stuff/kisssroot/output/host/usr/include -Wall -o xsltproc xsltproc.o 
-L/media/stuff/kisssroot/output/host/lib
-L/media/stuff/kisssroot/output/host/usr/lib -L/usr/lib64
../libxslt/.libs/libxslt.so ../libexslt/.libs/libexslt.so
/usr/lib64/libgcrypt.so /usr/lib64/libgpg-error.so
/media/stuff/kisssroot/output/build/host-libxslt-1.1.24/libxslt/.libs/libxslt.so
/usr/lib64/libxml2.so /media/stuff/kisssroot/output/host/usr/lib/libxml2.so
-ldl -lz -lm   -Wl,--rpath
-Wl,/media/stuff/kisssroot/output/build/host-libxslt-1.1.24/libxslt/.libs
-Wl,--rpath
-Wl,/media/stuff/kisssroot/output/build/host-libxslt-1.1.24/libexslt/.libs
-Wl,--rpath -Wl,/media/stuff/kisssroot/output/host/usr/lib -Wl,--rpath
-Wl,/media/stuff/kisssroot/output/host/usr/lib                                  
../libxslt/.libs/libxslt.so: undefined reference to
`xmlGetLineNo at LIBXML2_2.4.30'                                                   
../libxslt/.libs/libxslt.so: undefined reference to
`xmlIsExtenderGroup at LIBXML2_2.6.0'                                              
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathFreeContext at LIBXML2_2.4.30'                                            
../libxslt/.libs/libxslt.so: undefined reference to `xmlMalloc at LIBXML2_2.4.30'  
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathIsNodeType at LIBXML2_2.4.30'                                             
../libxslt/.libs/libxslt.so: undefined reference to `xmlStrchr at LIBXML2_2.4.30'  
../libxslt/.libs/libxslt.so: undefined reference to `xmlFreeDtd at LIBXML2_2.4.30' 
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathCtxtCompile at LIBXML2_2.6.5'                                             
../libxslt/.libs/libxslt.so: undefined reference to
`xmlSplitQName2 at LIBXML2_2.4.30'                                                 
../libxslt/.libs/libxslt.so: undefined reference to
`xmlHashUpdateEntry at LIBXML2_2.4.30'                                             
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathEvalPredicate at LIBXML2_2.4.30'                                          
../libxslt/.libs/libxslt.so: undefined reference to `xmlRealloc at LIBXML2_2.4.30' 
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathContextSetCache at LIBXML2_2.6.25'                                        
../libxslt/.libs/libxslt.so: undefined reference to `xmlFreeURI at LIBXML2_2.4.30' 
../libxslt/.libs/libxslt.so: undefined reference to
`xmlAddPrevSibling at LIBXML2_2.4.30'                                              
../libxslt/.libs/libxslt.so: undefined reference to
`xmlFindCharEncodingHandler at LIBXML2_2.4.30'                                     
../libxslt/.libs/libxslt.so: undefined reference to
`xmlHashFree at LIBXML2_2.4.30'                                                    
../libxslt/.libs/libxslt.so: undefined reference to `xmlSetProp at LIBXML2_2.4.30' 
../libxslt/.libs/libxslt.so: undefined reference to `valuePop at LIBXML2_2.4.30'   
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathIsNaN at LIBXML2_2.4.30'                                                  
../libxslt/.libs/libxslt.so: undefined reference to
`xmlFreeIDTable at LIBXML2_2.4.30'                                                 
../libxslt/.libs/libxslt.so: undefined reference to
`xmlHashRemoveEntry2 at LIBXML2_2.4.30'                                            
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPtrEval at LIBXML2_2.4.30'                                                    
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathNextAncestor at LIBXML2_2.4.30'                                           
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathInit at LIBXML2_2.4.30'                                                   
../libxslt/.libs/libxslt.so: undefined reference to
`xmlHashScan at LIBXML2_2.4.30'                                                    
../libxslt/.libs/libxslt.so: undefined reference to
`xmlOutputBufferCreateFd at LIBXML2_2.4.30'                                        
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathCompiledEval at LIBXML2_2.4.30'                                           
../libxslt/.libs/libxslt.so: undefined reference to
`xmlHashAddEntry3 at LIBXML2_2.4.30'                                               
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathFreeParserContext at LIBXML2_2.4.30'                                      
../libxslt/.libs/libxslt.so: undefined reference to `xmlXPathErr at LIBXML2_2.6.0' 
../libxslt/.libs/libxslt.so: undefined reference to
`xmlDictCreateSub at LIBXML2_2.6.5'                                                
../libxslt/.libs/libxslt.so: undefined reference to
`xmlDocSetRootElement at LIBXML2_2.4.30'                                           
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathObjectCopy at LIBXML2_2.4.30'                                             
../libxslt/.libs/libxslt.so: undefined reference to
`xmlDictReference at LIBXML2_2.6.0'                                                
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPtrNewContext at LIBXML2_2.4.30'                                              
../libxslt/.libs/libxslt.so: undefined reference to `xmlNewText at LIBXML2_2.4.30' 
../libxslt/.libs/libxslt.so: undefined reference to
`xmlNewComment at LIBXML2_2.4.30'                                                  
../libxslt/.libs/libxslt.so: undefined reference to
`xmlOutputBufferClose at LIBXML2_2.4.30'                                           
../libxslt/.libs/libxslt.so: undefined reference to
`xmlBufferCat at LIBXML2_2.4.30'                                                   
../libxslt/.libs/libxslt.so: undefined reference to
`xmlNodeDumpOutput at LIBXML2_2.4.30'                                              
../libxslt/.libs/libxslt.so: undefined reference to
`xmlHashLookup3 at LIBXML2_2.4.30'                                                 
../libxslt/.libs/libxslt.so: undefined reference to
`xmlHasNsProp at LIBXML2_2.4.30'                                                   
../libxslt/.libs/libxslt.so: undefined reference to
`xmlIsDigitGroup at LIBXML2_2.6.0'                                                 
../libxslt/.libs/libxslt.so: undefined reference to
`htmlDocContentDumpOutput at LIBXML2_2.4.30'                                       
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathRegisterFunc at LIBXML2_2.4.30'                                           
../libxslt/.libs/libxslt.so: undefined reference to
`xmlStrPrintf at LIBXML2_2.6.0'                                                    
../libxslt/.libs/libxslt.so: undefined reference to `xmlStrndup at LIBXML2_2.4.30' 
../libxslt/.libs/libxslt.so: undefined reference to
`xmlSearchNs at LIBXML2_2.4.30'                                                    
../libxslt/.libs/libxslt.so: undefined reference to
`xmlNewDocNode at LIBXML2_2.4.30'                                                  
../libxslt/.libs/libxslt.so: undefined reference to
`xmlValidateQName at LIBXML2_2.5.4'                                                
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathNodeSetAddUnique at LIBXML2_2.4.30'                                       
../libxslt/.libs/libxslt.so: undefined reference to
`xmlValidateNCName at LIBXML2_2.5.4'                                               
../libxslt/.libs/libxslt.so: undefined reference to
`xmlNodeAddContent at LIBXML2_2.4.30'                                              
../libxslt/.libs/libxslt.so: undefined reference to `xmlGetID at LIBXML2_2.4.30'   
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathRegisterFuncLookup at LIBXML2_2.4.30'                                     
../libxslt/.libs/libxslt.so: undefined reference to
`xmlFreeRefTable at LIBXML2_2.4.30'                                                
../libxslt/.libs/libxslt.so: undefined reference to `xmlStrdup at LIBXML2_2.4.30'  
../libxslt/.libs/libxslt.so: undefined reference to
`xmlModuleSymbol at LIBXML2_2.6.17'                                                
../libxslt/.libs/libxslt.so: undefined reference to
`xmlHashUpdateEntry2 at LIBXML2_2.4.30'                                            
../libxslt/.libs/libxslt.so: undefined reference to
`xmlBufferFree at LIBXML2_2.4.30'                                                  
../libxslt/.libs/libxslt.so: undefined reference to
`xmlNewDocText at LIBXML2_2.4.30'                                                  
../libxslt/.libs/libxslt.so: undefined reference to
`xmlUnlinkNode at LIBXML2_2.4.30'                                                  
../libxslt/.libs/libxslt.so: undefined reference to
`xmlNewChild at LIBXML2_2.4.30'                                                    
../libxslt/.libs/libxslt.so: undefined reference to
`xmlNodeGetBase at LIBXML2_2.4.30'                                                 
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathNodeSetMerge at LIBXML2_2.4.30'                                           
../libxslt/.libs/libxslt.so: undefined reference to
`xmlFreeNode at LIBXML2_2.4.30'                                                    
../libxslt/.libs/libxslt.so: undefined reference to `xmlStrstr at LIBXML2_2.4.30'  
../libxslt/.libs/libxslt.so: undefined reference to
`xmlDictLookup at LIBXML2_2.6.0'                                                   
../libxslt/.libs/libxslt.so: undefined reference to
`xmlGenericError at LIBXML2_2.4.30'                                                
../libxslt/.libs/libxslt.so: undefined reference to
`xmlBufferWriteQuotedString at LIBXML2_2.4.30'                                     
../libxslt/.libs/libxslt.so: undefined reference to
`xmlNewDocPI at LIBXML2_2.6.15'                                                    
../libxslt/.libs/libxslt.so: undefined reference to
`xmlDocGetRootElement at LIBXML2_2.4.30'                                           
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathNumberFunction at LIBXML2_2.4.30'                                         
../libxslt/.libs/libxslt.so: undefined reference to
`xmlIsBaseCharGroup at LIBXML2_2.6.0'                                              
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathNewContext at LIBXML2_2.4.30'                                             
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathWrapNodeSet at LIBXML2_2.4.30'                                            
../libxslt/.libs/libxslt.so: undefined reference to
`xmlNodeSetContent at LIBXML2_2.4.30'                                              
../libxslt/.libs/libxslt.so: undefined reference to
`xmlGetIntSubset at LIBXML2_2.4.30'                                                
../libxslt/.libs/libxslt.so: undefined reference to
`xmlParseURI at LIBXML2_2.4.30'                                                    
../libxslt/.libs/libxslt.so: undefined reference to
`xmlGetDtdAttrDesc at LIBXML2_2.4.30'                                              
../libxslt/.libs/libxslt.so: undefined reference to
`xmlBufferAdd at LIBXML2_2.4.30'                                                   
../libxslt/.libs/libxslt.so: undefined reference to
`xmlParseDocument at LIBXML2_2.4.30'                                               
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathFreeNodeSet at LIBXML2_2.4.30'                                            
../libxslt/.libs/libxslt.so: undefined reference to
`xmlHashCreate at LIBXML2_2.4.30'                                                  
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathCastToString at LIBXML2_2.4.30'                                           
../libxslt/.libs/libxslt.so: undefined reference to
`xmlCheckFilename at LIBXML2_2.4.30'                                               
../libxslt/.libs/libxslt.so: undefined reference to
`htmlDocContentDumpFormatOutput at LIBXML2_2.4.30'                                 
../libxslt/.libs/libxslt.so: undefined reference to
`xmlLoadExternalEntity at LIBXML2_2.4.30'                                          
../libxslt/.libs/libxslt.so: undefined reference to
`xmlModuleOpen at LIBXML2_2.6.17'                                                  
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathCompile at LIBXML2_2.4.30'                                                
../libxslt/.libs/libxslt.so: undefined reference to `htmlNewDoc at LIBXML2_2.4.30' 
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathStringFunction at LIBXML2_2.4.30'                                         
../libxslt/.libs/libxslt.so: undefined reference to
`xmlDocCopyNode at LIBXML2_2.4.30'                                                 
../libxslt/.libs/libxslt.so: undefined reference to `xmlNewNs at LIBXML2_2.4.30'   
../libxslt/.libs/libxslt.so: undefined reference to
`xmlNewParserCtxt at LIBXML2_2.4.30'                                               
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathConvertString at LIBXML2_2.4.30'                                          
../libxslt/.libs/libxslt.so: undefined reference to
`xmlNewNsProp at LIBXML2_2.4.30'                                                   
../libxslt/.libs/libxslt.so: undefined reference to
`xmlGetDocEntity at LIBXML2_2.4.30'                                                
../libxslt/.libs/libxslt.so: undefined reference to
`xmlNodeGetSpacePreserve at LIBXML2_2.4.30'                                        
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathOrderDocElems at LIBXML2_2.5.6'                                           
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathNewParserContext at LIBXML2_2.4.30'                                       
../libxslt/.libs/libxslt.so: undefined reference to
`xmlDictCreate at LIBXML2_2.6.0'                                                   
../libxslt/.libs/libxslt.so: undefined reference to `xmlFree at LIBXML2_2.4.30'    
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathRegisterFuncNS at LIBXML2_2.4.30'                                         
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathDebugDumpObject at LIBXML2_2.4.30'                                        
../libxslt/.libs/libxslt.so: undefined reference to
`xmlDictQLookup at LIBXML2_2.6.0'                                                  
../libxslt/.libs/libxslt.so: undefined reference to
`xmlGenericErrorContext at LIBXML2_2.4.30'                                         
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathEvalExpression at LIBXML2_2.4.30'                                         
../libxslt/.libs/libxslt.so: undefined reference to
`htmlNewDocNoDtD at LIBXML2_2.4.30'                                                
../libxslt/.libs/libxslt.so: undefined reference to
`xmlHashLookup2 at LIBXML2_2.4.30'                                                 
../libxslt/.libs/libxslt.so: undefined reference to
`xmlOutputBufferWriteString at LIBXML2_2.4.30'                                     
../libxslt/.libs/libxslt.so: undefined reference to
`xmlOutputBufferCreateFilename at LIBXML2_2.4.30'                                  
../libxslt/.libs/libxslt.so: undefined reference to `xmlStrncat at LIBXML2_2.4.30' 
../libxslt/.libs/libxslt.so: undefined reference to `xmlStrlen at LIBXML2_2.4.30'  
../libxslt/.libs/libxslt.so: undefined reference to
`xmlCharInRange at LIBXML2_2.6.0'                                                  
../libxslt/.libs/libxslt.so: undefined reference to `xmlNewDoc at LIBXML2_2.4.30'  
../libxslt/.libs/libxslt.so: undefined reference to
`xmlAddChild at LIBXML2_2.4.30'                                                    
../libxslt/.libs/libxslt.so: undefined reference to
`xmlGetCharEncodingName at LIBXML2_2.4.30'                                         
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathRegisterVariableLookup at LIBXML2_2.4.30'                                 
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathFreeCompExpr at LIBXML2_2.4.30'                                           
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathNewCString at LIBXML2_2.4.30'                                             
../libxslt/.libs/libxslt.so: undefined reference to
`xmlStrncasecmp at LIBXML2_2.4.30'                                                 
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXIncludeProcessFlags at LIBXML2_2.6.3'                                         
../libxslt/.libs/libxslt.so: undefined reference to
`xmlIsCombiningGroup at LIBXML2_2.6.0'                                             
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathNodeSetCreate at LIBXML2_2.4.30'                                          
../libxslt/.libs/libxslt.so: undefined reference to
`xmlHashScanFull at LIBXML2_2.4.30'                                                
../libxslt/.libs/libxslt.so: undefined reference to `inputPush at LIBXML2_2.4.30'  
../libxslt/.libs/libxslt.so: undefined reference to
`xmlStrEqual at LIBXML2_2.4.30'                                                    
../libxslt/.libs/libxslt.so: undefined reference to `valuePush at LIBXML2_2.4.30'  
../libxslt/.libs/libxslt.so: undefined reference to
`xmlGetNsList at LIBXML2_2.4.30'                                                   
../libxslt/.libs/libxslt.so: undefined reference to
`xmlIsBlankNode at LIBXML2_2.4.30'                                                 
../libxslt/.libs/libxslt.so: undefined reference to
`xmlURIEscapeStr at LIBXML2_2.4.30'                                                
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathCmpNodes at LIBXML2_2.4.30'                                               
../libxslt/.libs/libxslt.so: undefined reference to
`xmlCreateURI at LIBXML2_2.4.30'                                                   
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathNextPrecedingSibling at LIBXML2_2.4.30'                                   
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathIsInf at LIBXML2_2.4.30'                                                  
../libxslt/.libs/libxslt.so: undefined reference to `xmlDictFree at LIBXML2_2.6.0' 
../libxslt/.libs/libxslt.so: undefined reference to
`xmlBufferCCat at LIBXML2_2.4.30'                                                  
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathCompiledEvalToBoolean at LIBXML2_2.6.27'                                  
../libxslt/.libs/libxslt.so: undefined reference to
`xmlOutputBufferCreateFile at LIBXML2_2.4.30'                                      
../libxslt/.libs/libxslt.so: undefined reference to `xmlSaveUri at LIBXML2_2.4.30' 
../libxslt/.libs/libxslt.so: undefined reference to
`xmlNewDocProp at LIBXML2_2.4.30'                                                  
../libxslt/.libs/libxslt.so: undefined reference to
`xmlFreeParserCtxt at LIBXML2_2.4.30'                                              
../libxslt/.libs/libxslt.so: undefined reference to
`xmlNewDocNodeEatName at LIBXML2_2.4.30'                                           
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathNodeSetAdd at LIBXML2_2.4.30'                                             
../libxslt/.libs/libxslt.so: undefined reference to
`xmlStringTextNoenc at LIBXML2_2.4.30'                                             
../libxslt/.libs/libxslt.so: undefined reference to
`xmlSearchNsByHref at LIBXML2_2.4.30'                                              
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathStringEvalNumber at LIBXML2_2.4.30'                                       
../libxslt/.libs/libxslt.so: undefined reference to
`xmlNewCDataBlock at LIBXML2_2.4.30'                                               
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathNewValueTree at LIBXML2_2.4.30'                                           
../libxslt/.libs/libxslt.so: undefined reference to
`xmlBufferCreate at LIBXML2_2.4.30'                                                
../libxslt/.libs/libxslt.so: undefined reference to
`xmlHashAddEntry2 at LIBXML2_2.4.30'                                               
../libxslt/.libs/libxslt.so: undefined reference to
`xmlFreeNodeList at LIBXML2_2.4.30'                                                
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathNewString at LIBXML2_2.4.30'                                              
../libxslt/.libs/libxslt.so: undefined reference to
`xmlStringText at LIBXML2_2.4.30'                                                  
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathEval at LIBXML2_2.4.30'                                                   
../libxslt/.libs/libxslt.so: undefined reference to
`xmlOutputBufferFlush at LIBXML2_2.4.30'                                           
../libxslt/.libs/libxslt.so: undefined reference to
`xmlBufferContent at LIBXML2_2.4.30'                                               
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathNsLookup at LIBXML2_2.4.30'
../libxslt/.libs/libxslt.so: undefined reference to `xmlGetProp at LIBXML2_2.4.30'
../libxslt/.libs/libxslt.so: undefined reference to
`xmlParserGetDirectory at LIBXML2_2.4.30'
../libxslt/.libs/libxslt.so: undefined reference to
`xmlUTF8Strloc at LIBXML2_2.4.30'
../libxslt/.libs/libxslt.so: undefined reference to
`xmlHashRemoveEntry at LIBXML2_2.4.30'
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathFreeObject at LIBXML2_2.4.30'
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathNewBoolean at LIBXML2_2.4.30'
../libxslt/.libs/libxslt.so: undefined reference to
`xmlUTF8Strpos at LIBXML2_2.4.30'
../libxslt/.libs/libxslt.so: undefined reference to `xmlStrncmp at LIBXML2_2.4.30'
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathFunctionLookupNS at LIBXML2_2.4.30'
../libxslt/.libs/libxslt.so: undefined reference to
`xmlCtxtUseOptions at LIBXML2_2.6.0'
../libxslt/.libs/libxslt.so: undefined reference to
`xmlGetNsProp at LIBXML2_2.4.30'
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathCastNodeToString at LIBXML2_2.4.30'
../libxslt/.libs/libxslt.so: undefined reference to
`xmlNewTextLen at LIBXML2_2.4.30'
../libxslt/.libs/libxslt.so: undefined reference to
`xmlNodeListGetString at LIBXML2_2.4.30'
../libxslt/.libs/libxslt.so: undefined reference to
`xmlHashAddEntry at LIBXML2_2.4.30'
../libxslt/.libs/libxslt.so: undefined reference to
`xmlAllocOutputBuffer at LIBXML2_2.4.30'
../libxslt/.libs/libxslt.so: undefined reference to
`xmlModuleClose at LIBXML2_2.6.17'
../libxslt/.libs/libxslt.so: undefined reference to
`xmlSetNsProp at LIBXML2_2.4.30'
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathConvertNumber at LIBXML2_2.4.30'
../libxslt/.libs/libxslt.so: undefined reference to
`xmlStrcasecmp at LIBXML2_2.4.30'
../libxslt/.libs/libxslt.so: undefined reference to
`xmlNodeGetContent at LIBXML2_2.4.30'
../libxslt/.libs/libxslt.so: undefined reference to `xmlStrcmp at LIBXML2_2.4.30'
../libxslt/.libs/libxslt.so: undefined reference to
`xmlCreateIntSubset at LIBXML2_2.4.30'
../libxslt/.libs/libxslt.so: undefined reference to `xmlFreeDoc at LIBXML2_2.4.30'
../libxslt/.libs/libxslt.so: undefined reference to
`xmlCopyCharMultiByte at LIBXML2_2.4.30'
../libxslt/.libs/libxslt.so: undefined reference to
`xmlHashUpdateEntry3 at LIBXML2_2.4.30'
../libxslt/.libs/libxslt.so: undefined reference to `xmlDictOwns at LIBXML2_2.6.0'
../libxslt/.libs/libxslt.so: undefined reference to `xmlStrcat at LIBXML2_2.4.30'
../libxslt/.libs/libxslt.so: undefined reference to
`xmlStringCurrentChar at LIBXML2_2.4.30'
../libxslt/.libs/libxslt.so: undefined reference to
`xmlXPathNewNodeSet at LIBXML2_2.4.30'
../libxslt/.libs/libxslt.so: undefined reference to
`htmlSetMetaEncoding at LIBXML2_2.4.30'
../libxslt/.libs/libxslt.so: undefined reference to
`xmlHashLookup at LIBXML2_2.4.30'
../libxslt/.libs/libxslt.so: undefined reference to
`xmlBuildURI at LIBXML2_2.4.30'
collect2: ld returned 1 exit status
make[3]: *** [xsltproc] Error 1
make[3]: Leaving directory
`/media/stuff/kisssroot/output/build/host-libxslt-1.1.24/xsltproc'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/media/stuff/kisssroot/output/build/host-libxslt-1.1.24'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/media/stuff/kisssroot/output/build/host-libxslt-1.1.24'
make: ***
[/media/stuff/kisssroot/output/build/host-libxslt-1.1.24/.stamp_built] Error 2


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
